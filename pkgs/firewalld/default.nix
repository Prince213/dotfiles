{
  stdenv,
  fetchFromGitHub,
  autoreconfHook,
  docbook_xml_dtd_42,
  docbook-xsl-nons,
  glib,
  gobject-introspection,
  intltool,
  ipset,
  iptables,
  kdePackages,
  libnotify,
  libsForQt5,
  libxml2,
  libxslt,
  networkmanager,
  pkg-config,
  python3,
  wrapGAppsHook3,
  ...
}:

let
  python3' = python3.withPackages (
    ps: with ps; [
      dbus-python
      nftables
      pygobject3
      pyqt5
    ]
  );
in
stdenv.mkDerivation rec {
  pname = "firewalld";
  version = "2.3.0";

  src = fetchFromGitHub {
    owner = "firewalld";
    repo = "firewalld";
    rev = "v${version}";
    hash = "sha256-ubE1zMIOcdg2+mgXsk6brCZxS1XkvJYwVY3E+UXIIiU=";
  };

  patches = [
    ./respect-xml-catalog-files-var.patch
  ];

  postPatch = ''
    substituteInPlace src/firewall/config/__init__.py.in \
      --replace-fail /usr "$out"

    for file in config/firewall-{applet,config}.desktop.in; do
      substituteInPlace $file \
        --replace-fail /usr "$out"
    done

    substituteInPlace src/firewall-applet.in \
      --replace-fail /usr "${kdePackages.systemsettings}"
  '';

  nativeBuildInputs = [
    autoreconfHook
    wrapGAppsHook3
    libsForQt5.wrapQtAppsHook
    python3'
    python3'.pkgs.wrapPython
    intltool
    ipset
    iptables
    libxml2
    libxslt
    glib
    gobject-introspection
    pkg-config
  ];

  buildInputs = [
    docbook-xsl-nons
    docbook_xml_dtd_42
    libnotify
    networkmanager
  ];

  dontWrapGApps = true;
  dontWrapQtApps = true;

  preFixup = ''
    makeWrapperArgs+=("''${gappsWrapperArgs[@]}")
    makeWrapperArgs+=("''${qtWrapperArgs[@]}")
  '';

  postFixup = ''
    wrapPythonPrograms
  '';
}
