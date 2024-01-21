enum PharmacyHubPaths {
  home('/home'),
  pharmacyDetails('/home/pharmacy-details/:pharmacyId');

  const PharmacyHubPaths(this.path);
  final String path;

  String replaceParam(String paramName, String replacement) {
    try {
      return path.replaceAll(':$paramName', replacement);
    } catch (e) {
      return path;
    }
  }
}
