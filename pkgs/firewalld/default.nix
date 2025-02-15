{
  stdenv,
  fetchFromGitHub,
  autoreconfHook,
  wrapGAppsHook3,
  python3,
  intltool,
  ipset,
  iptables,
  libxml2,
  libxslt,
  glib,
  gobject-introspection,
  pkg-config,
  docbook-xsl-nons,
  docbook_xml_dtd_42,
  ...
}:

let
  python3' = python3.withPackages (
    ps: with ps; [
      dbus-python
      nftables
      pygobject3
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
  '';

  nativeBuildInputs = [
    autoreconfHook
    wrapGAppsHook3
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
  ];

  dontWrapGApps = true;

  preFixup = ''
    makeWrapperArgs+=("''${gappsWrapperArgs[@]}")
  '';

  postFixup = ''
    wrapPythonPrograms
  '';
}
