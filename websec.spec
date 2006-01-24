Name:		websec 
Version: 	1.9.0
Release: 	2
Summary: 	Web Secretary is a web page monitoring software
License: 	GPL
Group: 		Networking/WWW
Url:		http://baruch.ev-en.org/proj/websec/
Source: 	%name-%version.tar.gz
BuildArch:      noarch

Requires:       perl-libwww-perl

BuildRequires: perl-URI perl-libwww-perl

BuildRoot: %{_tmppath}/%{name}-%{version}-root

%description
Web Secretary is a web page monitoring software. However, it goes beyond the normal functionalities offered by such software. It will detect changes based on content analysis, making sure that it's not just HTML that changed, but actual content. You can tell it what to ignore in the page (hit counters and such), and it can mail you the document with the changes highlighted or load the highlighted page in a browser.

Web Secretary is actually a suite of two Perl scripts called websec and webdiff. websec retrieves web pages and email them to you based on a URL list that you provide. webdiff compares two web pages (current and archive) and creates a new page based on the current page but with all the differences highlighted using a predefined color. 

%prep
%setup -qn %name-%version

%build

%install
rm -rf %buildroot
mkdir %buildroot
make PREFIX=%buildroot/usr \
	DOCDIR=%buildroot/usr/share/doc/%name-%version \
	VIMSYNDIR=%buildroot/usr/share/vim/syntax \
	install


%files
%defattr(-, root, root, 0755)
%_bindir/*
%_mandir/man1/*
%_mandir/man5/*
%_datadir/emacs/*
%_datadir/vim/*
%doc COPYING NEWS README TODO ignore.list url.list

%changelog
* Thu Jan 23 2006 Peter Bieringer <pbieringer@aerasec.de> 1.9.0-2
- Update to 1.9.0
- add defattr on %files

* Thu Feb 10 2005 Peter Bieringer <pbieringer@aerasec.de> 1.8.0-1
- Redesigned for 1.8.0

* Mon Oct 06 2003 Egor S. Orlov <oes@altlinux.ru> 1.7.0-alt2
- Fixed package intersections in mandirs

* Fri Oct 03 2003 Egor S. Orlov <oes@altlinux.ru> 1.7.0-alt1
- fixed requires
- Russian description

* Wed Sep 17 2003 Egor S. Orlov <oes@altlinux.ru> 1.7.0-alt0.3
- Fixed buildreq using --args=-bi
- Hasher build

* Mon Sep 15 2003 Egor S. Orlov <oes@altlinux.ru> 1.7.0-alt0.2
- Fixed requires 

* Fri Sep 12 2003 Egor S. Orlov <oes@altlinux.ru> 1.7.0-alt0.1
- Initial build for ALT

