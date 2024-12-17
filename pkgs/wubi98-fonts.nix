{
  stdenvNoCC,
  fetchFromGitHub,
  p7zip,
  ...
}:

stdenvNoCC.mkDerivation {
  pname = "wubi98-fonts";
  version = "2024-01-31";

  src = fetchFromGitHub {
    owner = "yanhuacuo";
    repo = "98wubi";
    rev = "3b2f2769cf39f9253fd0e6594e85ae3f7f5c72d0";
    hash = "sha256-Qtw38bMxG/DBisuYuEccBTmyUFBguaiRAxsHAjGbEDw=";
  };

  nativeBuildInputs = [
    p7zip
  ];

  buildPhase = ''
    7z e fonts/字体支持更新-20240131.7z.001
  '';

  installPhase = ''
    install -Dt $out/share/fonts/opentype/wubi98-fonts 98WB-{0,1,2,3,U,V}.otf
  '';
}
