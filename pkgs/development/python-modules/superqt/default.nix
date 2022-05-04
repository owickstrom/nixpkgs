{ lib
, buildPythonPackage
, fetchFromGitHub
, setuptools-scm
, pyqt5
, qtpy
, typing-extensions
, pytest
, pytestCheckHook
}:

buildPythonPackage rec {
  pname = "superqt";
  version = "0.3.2";

  src = fetchFromGitHub {
    owner = "napari";
    repo = pname;
    rev = "refs/tags/v${version}";
    sha256 = "sha256-P1uKQaYgXVTE7DK5w4Ct4aJyfdQ6jUPfaTOcYkpo9pc=";
  };
  format = "pyproject";
  nativeBuildInputs = [ setuptools-scm ];
  propagatedBuildInputs = [ pyqt5 qtpy typing-extensions ];
  checkInputs = [ pytestCheckHook pytest ];
  doCheck = false; # Segfaults...
  SETUPTOOLS_SCM_PRETEND_VERSION = version;

  meta = with lib; {
    description = "Missing widgets and components for Qt-python (napari/superqt)";
    homepage = "https://github.com/napari/superqt";
    license = licenses.bsd3;
    maintainers = with maintainers; [ SomeoneSerge ];
  };
}
