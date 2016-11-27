
%define ver 0.9.42
%define prefix /usr/X11R6

Summary: X11 Window Manager Themes
Name: icewm-themes
Prefix: %prefix
Version: %ver
BuildArch: noarch
Release: 1
Copyright: LGPL
Group: X11/Window Managers
Source: icewm-themes-%ver.tar.gz
URL: http://www.kiss.uni-lj.si/~k4fr0235/icewm/
Packager: Marko Macek <Marko.Macek@gmx.net>
BuildRoot: /tmp/build-icewm-themes-%ver

%description
Themes for icewm window manager.

%prep

%setup

%build

%install
make PREFIX=$RPM_BUILD_ROOT%{prefix} install

%clean
rm -rf $RPM_BUILD_ROOT

%files
%defattr(-,root,root)
%{prefix}/lib/X11/icewm/themes/
