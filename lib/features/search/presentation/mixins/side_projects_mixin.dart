import 'package:rg_portfolio/features/search/domain/models/project.dart';

// Why this a mixin and not a simple provider / class / list ???

/// Contains my projects
mixin SideProjectsMixin {
  List<Project> getProjects() {
    const commonReference =
        'https://play.google.com/store/apps/details?id=com.rg.rg_projects';

    return const [
      Project(
        title: 'WhatsApp (Design)',
        subtitle: 'Chat and camera animations like WhatsApp',
        reference: commonReference,
        imageUrl:
            'https://res.cloudinary.com/ddm4cvddw/image/upload/v1646084911/rg_portfolio/project_overviews/omeg3ffxxfjxlxy7vi5m.png',
      ),
      Project(
        title: 'Credit App (Design)',
        subtitle: 'Animations with AnimateBuilder and Custom Paint',
        imageUrl:
            'https://res.cloudinary.com/ddm4cvddw/image/upload/v1646084909/rg_portfolio/project_overviews/xf2kpz28quop0njceoyo.png',
        reference: commonReference,
      ),
      Project(
        title: 'Payment Handler',
        subtitle: 'Blur and Custom animations',
        imageUrl:
            'https://res.cloudinary.com/ddm4cvddw/image/upload/v1646084907/rg_portfolio/project_overviews/jf5hjgy1yqthe4astryi.png',
        reference: commonReference,
      ),
      Project(
        title: 'Clock',
        subtitle: 'A clock with fancy animations over the web',
        imageUrl:
            'https://res.cloudinary.com/ddm4cvddw/image/upload/v1646084894/rg_portfolio/project_overviews/tqecbds2aed7k0snyuor.png',
        reference: 'https://rgprojects.netlify.app/#/clock',
      ),
    ];
  }
}
