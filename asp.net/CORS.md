# CORS

## Resources

* http://stackoverflow.com/questions/12173990/how-can-you-debug-a-cors-request-with-curl

## Testing CORS requests


**Sending a regular CORS request using cUrl:**

```
curl -H "Origin: http://example.com" --verbose \
  https://www.googleapis.com/discovery/v1/apis?fields=
```  

* The -H "Origin: http://example.com" flag is the third party domain making the request. Substitute in whatever your domain is.
* The --verbose flag prints out the entire response so you can see the request and response headers.
* The url I'm using above is a sample request to a Google API that supports CORS, but you can substitute in whatever url you are testing.
* The response should include the Access-Control-Allow-Origin header.

**Sending a preflight request using cUrl:**

```
curl -H "Origin: http://example.com" \
  -H "Access-Control-Request-Method: POST" \
  -H "Access-Control-Request-Headers: X-Requested-With" \
  -X OPTIONS --verbose \
  https://www.googleapis.com/discovery/v1/apis?fields=
```  

This looks similar to the regular CORS request with a few additions:

* The -H flags send additional preflight request headers to the server
* The -X OPTIONS flag indicates that this is an HTTP OPTIONS request.

If the preflight request is successful, the response should include the Access-Control-Allow-Origin, Access-Control-Allow-Methods, and  Access-Control-Allow-Headers response headers. If the preflight request was not successful, these headers shouldn't appear, or the HTTP response won't be 200.
You can also specify additional headers, such as User-Agent, by using the -H flag.
