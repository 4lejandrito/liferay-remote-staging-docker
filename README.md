# Liferay Remote Staging Docker Image

The image built from this dockerfile will start the portal with all the
properties needed for staging remote including the host ip address.

1. Build the image:
	
		docker build . -t liferay-staging-remote

2. Start it:

		docker run -e MYSQL_PASS=foo -e MYSQL_DATABASE=lportal -p 1989:8080 --rm --name liferay-staging-remote liferay-staging-remote
	
3. There is an extra manual step to be taken after the instance has been started that I couldn't automate which is going to:

	Control Panel → Configuration → System Settings → Foundation → Tunnel Auth Verifier → /api/liferay/do

	and adding the host ip address in the Hosts allowed field. The host address will be printed out during the image build 		along with all the other properties in the portal-ext.properties.


After these steps (and setting up the local instance) it should be ready to go.

Please note that the shared secret must be the same in both instances.
