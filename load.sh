cd O-RAN.WG4.MP-YANGs-v08.00/
cd Imported\ Models/
sysrepoctl -i iana-hardware.yang
sysrepoctl -i iana-if-type.yang
sysrepoctl -i ietf-crypto-types.yang
sysrepoctl -i ietf-datastores.yang
sysrepoctl -i ietf-dhcpv6-types.yang
sysrepoctl -i ietf-hardware.yang
sysrepoctl -i ietf-inet-types.yang
sysrepoctl -i ietf-interfaces.yang
sysrepoctl -i ietf-ip.yang
sysrepoctl -i ietf-netconf-acm.yang
sysrepoctl -i ietf-netconf-monitoring.yang
sysrepoctl -i ietf-network-instance.yang
sysrepoctl -i ietf-restconf.yang
sysrepoctl -i ietf-subscribed-notifications.yang
sysrepoctl -i ietf-yang-library.yang
sysrepoctl -i ietf-yang-schema-mount.yang
sysrepoctl -i ietf-yang-types.yang
cd ..
cd Common\ Models/
cd System/
sysrepoctl -i o-ran-wg4-features.yang
sysrepoctl -i o-ran-fan.yang
sysrepoctl -i o-ran-fm.yang
sysrepoctl -i o-ran-hardware.yang
sysrepoctl -i o-ran-supervision.yang
sysrepoctl -i o-ran-usermgmt.yang -I user_data.xml
sysrepoctl -i o-ran-ves-subscribed-notifications.yang
cd ..
cd Interfaces/
sysrepoctl -i o-ran-ald-port.yang
sysrepoctl -i o-ran-dhcp.yang
sysrepoctl -i o-ran-interfaces.yang
sysrepoctl -i o-ran-ethernet-forwarding.yang
sysrepoctl -i o-ran-externalio.yang
sysrepoctl -i o-ran-mplane-int.yang
sysrepoctl -i o-ran-transceiver.yang
cd ..
cd Operations/
sysrepoctl -i o-ran-ald.yang
sysrepoctl -i o-ran-file-management.yang
sysrepoctl -i o-ran-operations.yang
sysrepoctl -i o-ran-software-management.yang
sysrepoctl -i o-ran-trace.yang
sysrepoctl -i o-ran-troubleshooting.yang
cd ..
cd Sync/
sysrepoctl -i o-ran-sync.yang
cd ..
cd ..
cd RU\ Specific\ Models/
cd Interfaces/
sysrepoctl -i o-ran-processing-element.yang
cd ..
cd Radio/
sysrepoctl -i o-ran-compression-factors.yang
sysrepoctl -i o-ran-module-cap.yang
sysrepoctl -i o-ran-antenna-calibration.yang
sysrepoctl -i o-ran-delay-management.yang
sysrepoctl -i o-ran-laa.yang
sysrepoctl -i o-ran-laa-operations.yang
sysrepoctl -i o-ran-shared-cell.yang
cd ..
cd Operations/
sysrepoctl -i o-ran-ecpri-delay.yang
sysrepoctl -i o-ran-lbm.yang
sysrepoctl -i o-ran-uplane-conf.yang
sysrepoctl -i o-ran-performance-management.yang
sysrepoctl -i o-ran-udp-echo.yang
cd ..
cd Radio/
sysrepoctl -i o-ran-beamforming.yang
cd ..
cd ..
cd ..

