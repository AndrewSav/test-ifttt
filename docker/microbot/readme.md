# Microbot - a simple conianer for testing

This container grabs the hostname on start and displays it when you navigate to it in the web browser on port 80.
The web page every second polls file at http(s)://host/success (which is located at /usr/share/nginx/html/success in the container).
If poll is successful a green smily face is displayed. If failure (success is absent or unreachable) a red sad face is displayed.

If you run the contaner as below and the browse to <http://localhost:8080> you will see the green smiley face. 
If after that you delete the container as below without closing the browser page, the face will turn red.
If you recreate the container again the page will turn back green, etc.

In addition if you mount /usr/share/nginx/html/success file to several containers, you will be able to remove and place back the file from a different container, chaning the smiley face accordingly this way.

To build:

```bash
docker build --rm=true --no-cache=true --pull=true -t andrewsav/microbot .
docker push andrewsav/microbot
```

To run:

```bash
docker run --rm --name microbot -d -p "8080:80" andrewsav/microbot
```

To delete:

```bash
docker rm microbot -f
```
