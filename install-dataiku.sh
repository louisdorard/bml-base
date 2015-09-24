apt-get update
apt-get install -y default-jre nginx # requirements for dss
pushd /work
mkdir /work/dss/
export dss_version=2.0.4
wget http://downloads.dataiku.com/public/studio/$dss_version/dataiku-dss-$dss_version.tar.gz
tar xzf dataiku-dss-$dss_version.tar.gz
mv dataiku-dss-$dss_version /opt

useradd dataiku
chown -R dataiku /opt/dataiku-dss-$dss_version
chown -R dataiku /work/dss
sudo -u dataiku /opt/dataiku-dss-$dss_version/installer.sh -d /work/dss -p 10000 -n
/opt/dataiku-dss-$dss_version/scripts/install/install-boot.sh /work/dss dataiku
sudo -u dataiku /work/dss/bin/dss start
popd
