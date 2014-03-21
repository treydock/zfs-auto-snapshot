Name:           zfs-auto-snapshot
Version:        %{?version}
Release:        %{?dist}
Summary:        ZFS Automatic Snapshot Service for Linux
License:        GPLv2+
Group:          Applications/System
URL:            https://github.com/zfsonlinux/%{name}
Source0:        %{name}-%{version}.tar.gz
BuildRoot:      %{_tmppath}/%{name}-%{version}-%{release}-root-%(%{__id_u} -n)
BuildArch:      noarch

%description
An alternative implementation of the zfs-auto-snapshot service for Linux
that is compatible with zfs-linux and zfs-fuse.

%prep
%setup -qn %{name}-%{version}

%build
# Do nothing

%install
rm -rf $RPM_BUILD_ROOT

make install DESTDIR=$RPM_BUILD_ROOT

%clean
rm -rf $RPM_BUILD_ROOT

%files
%defattr(-,root,root,-)
%doc README COPYING
%attr(0755, root, root) %{_sbindir}/zfs-auto-snapshot
%{_sysconfdir}/cron.d/%{name}
%{_sysconfdir}/cron.daily/%{name}
%{_sysconfdir}/cron.hourly/%{name}
%{_sysconfdir}/cron.monthly/%{name}
%{_sysconfdir}/cron.weekly/%{name}
%{_mandir}/man8/zfs-auto-snapshot.8.gz
%config(noreplace) %{_sysconfdir}/default/zfs-auto-snapshot

%changelog
* Tue Mar 18 2014 Trey Dockendorf <treydock@gmail.com> %{version}
- Initial spec file creation
