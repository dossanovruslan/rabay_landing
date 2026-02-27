#!/usr/bin/env python3
from __future__ import annotations

import datetime as dt
import os
from pathlib import Path


def inject_meta_before_head_close(html: str, meta_tag: str) -> str:
    if meta_tag in html:
        return html
    head_close = "</head>"
    if head_close not in html:
        return html
    return html.replace(head_close, f"  {meta_tag}\n{head_close}", 1)


def main() -> int:
    build_dir = Path(os.environ.get("BUILD_WEB_DIR", "build/web"))
    site_url = os.environ.get("SITE_URL", "https://rabay.kz").rstrip("/")
    gsc_token = os.environ.get("GSC_VERIFICATION_TOKEN", "").strip()
    bing_token = os.environ.get("BING_VERIFICATION_TOKEN", "").strip()

    if not build_dir.exists():
        print(f"[seo] build directory not found: {build_dir}")
        return 1

    today = dt.date.today().isoformat()

    sitemap_path = build_dir / "sitemap.xml"
    if sitemap_path.exists():
        sitemap_content = f'''<?xml version="1.0" encoding="UTF-8"?>
<urlset xmlns="http://www.sitemaps.org/schemas/sitemap/0.9">
  <url>
    <loc>{site_url}/</loc>
    <lastmod>{today}</lastmod>
    <changefreq>weekly</changefreq>
    <priority>1.0</priority>
  </url>
</urlset>
'''
        sitemap_path.write_text(sitemap_content, encoding="utf-8")
        print(f"[seo] sitemap updated: {sitemap_path}")

    robots_path = build_dir / "robots.txt"
    robots_content = f'''User-agent: *
Allow: /

Sitemap: {site_url}/sitemap.xml
Host: {site_url.replace("https://", "").replace("http://", "")}
'''
    robots_path.write_text(robots_content, encoding="utf-8")
    print(f"[seo] robots updated: {robots_path}")

    index_path = build_dir / "index.html"
    if index_path.exists():
        html = index_path.read_text(encoding="utf-8")

        if gsc_token:
            html = inject_meta_before_head_close(
                html,
                f'<meta name="google-site-verification" content="{gsc_token}">',
            )
            gsc_file = build_dir / f"google{gsc_token}.html"
            gsc_file.write_text(
                f"google-site-verification: google{gsc_token}.html\n",
                encoding="utf-8",
            )
            print(f"[seo] google verification file generated: {gsc_file.name}")

        if bing_token:
            html = inject_meta_before_head_close(
                html,
                f'<meta name="msvalidate.01" content="{bing_token}">',
            )
            bing_file = build_dir / "BingSiteAuth.xml"
            bing_file.write_text(
                "<?xml version=\"1.0\"?>\n"
                "<users>\n"
                f"  <user>{bing_token}</user>\n"
                "</users>\n",
                encoding="utf-8",
            )
            print(f"[seo] bing verification file generated: {bing_file.name}")

        index_path.write_text(html, encoding="utf-8")
        print(f"[seo] index updated: {index_path}")

    print("[seo] post-build SEO routine completed")
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
