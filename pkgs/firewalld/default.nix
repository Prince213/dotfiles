{
  stdenv,
  fetchFromGitHub,
  autoreconfHook,
  python3,
  intltool,
  ipset,
  iptables,
  libxml2,
  libxslt,
  glib,
  pkg-config,
  docbook-xsl-nons,
  docbook_xml_dtd_42,
  ...
}:

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

  nativeBuildInputs = [
    autoreconfHook
    python3
    intltool
    ipset
    iptables
    libxml2
    libxslt
    glib
    pkg-config
  ];

  buildInputs = [
    docbook-xsl-nons
    docbook_xml_dtd_42
  ];
}
