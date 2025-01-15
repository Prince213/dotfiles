{
  stdenv,
  fetchzip,
  autoPatchelfHook,
  makeWrapper,
  libgcc,
  ...
}:

stdenv.mkDerivation rec {
  pname = "mccgdi";
  version = "2.0.10";

  src = fetchzip {
    url = "https://www.psn-web.net/cs/support/fax/common/file/Linux_PrnDriver/Driver_Install_files/${pname}-${version}-x86_64.tar.gz";
    hash = "sha256-cDXkQwzom4RmLQ9m9EegoRNRdGUUaUk3C4Qfn11V7qw=";
  };

  nativeBuildInputs = [
    autoPatchelfHook
    makeWrapper
  ];

  buildInputs = [
    libgcc.lib
  ];

  buildPhase = ''
    cc -shared -fPIC ${./hook.c} -o libhook.so
  '';

  installPhase = ''
    mkdir -p $out/lib
    cp libhook.so $out/lib/

    mkdir -p $out/lib/cups/filter
    cp filter/L_H0JDGCZAZ $out/lib/cups/filter/

    mkdir -p $out/share/cups/model/panasonic
    cp ppd/* $out/share/cups/model/panasonic/
  '';

  postFixup = ''
    wrapProgram $out/lib/cups/filter/L_H0JDGCZAZ \
      --set LD_PRELOAD $out/lib/libhook.so
  '';

  meta = {
    description = "Panasonic multi-function station printer drivers";
    homepage = "https://docs.connect.panasonic.com/pcc/support/fax/";
    downloadPage = "https://docs.connect.panasonic.com/pcc/support/fax/common/table/linuxdriver.html";
    platforms = [ "x86_64-linux" ];
  };
}
