import 'package:auto_route/auto_route.dart';
import '../../features/landing/presentation/pages/landing_page.dart';
import '../../features/landing/presentation/pages/legal_documents_page.dart';
import '../../features/landing/presentation/pages/referral_details_page.dart';

class AppRouter {
  static RootStackRouter build() {
    return RootStackRouter.build(
      routes: [
        NamedRouteDef(
          name: LandingRoute.name,
          path: '/',
          builder: (context, data) => const LandingPage(),
        ),
        NamedRouteDef(
          name: ReferralDetailsRoute.name,
          path: '/referral-details',
          builder: (context, data) => const ReferralDetailsPage(),
        ),
        NamedRouteDef(
          name: PrivacyPolicyRoute.name,
          path: '/privacy-policy',
          builder: (context, data) => const PrivacyPolicyPage(),
        ),
        NamedRouteDef(
          name: TermsOfServiceRoute.name,
          path: '/terms-of-service',
          builder: (context, data) => const TermsOfServicePage(),
        ),
      ],
    );
  }
}

class LandingRoute extends PageRouteInfo<void> {
  const LandingRoute({List<PageRouteInfo>? children})
    : super(name, initialChildren: children);

  static const String name = 'LandingRoute';
}

class ReferralDetailsRoute extends PageRouteInfo<void> {
  const ReferralDetailsRoute({List<PageRouteInfo>? children})
    : super(name, initialChildren: children);

  static const String name = 'ReferralDetailsRoute';
}

class PrivacyPolicyRoute extends PageRouteInfo<void> {
  const PrivacyPolicyRoute({List<PageRouteInfo>? children})
    : super(name, initialChildren: children);

  static const String name = 'PrivacyPolicyRoute';
}

class TermsOfServiceRoute extends PageRouteInfo<void> {
  const TermsOfServiceRoute({List<PageRouteInfo>? children})
    : super(name, initialChildren: children);

  static const String name = 'TermsOfServiceRoute';
}
