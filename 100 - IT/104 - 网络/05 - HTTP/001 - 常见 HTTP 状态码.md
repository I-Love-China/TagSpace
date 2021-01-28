## HTTP 状态码
### 1xx informational response

| Code | Meaning             | Desc                                                         |
| ---- | ------------------- | ------------------------------------------------------------ |
| 100  | Continue            | The server has received the request headers and the client should proceed to send the request body.<br />Sending a large request body to a server after a request has been rejected for inappropriate headers would be inefficient. |
| 101  | Switching Protocols | The requester has asked the server to switch protocols and the server has agreed to do so. |



### 2xx success

| Code | Meaning                                                      |
| ---- | ------------------------------------------------------------ |
| 200  | OK                                                           |
| 201  | Created                                                      |
| 202  | Accepted                                                     |
| 203  | Non-Authoritative Information (since HTTP/1.1)               |
| 204  | No Content                                                   |
| 205  | Reset Content                                                |
| 206  | Partial Content ([RFC 7233](https://tools.ietf.org/html/rfc7233)) |
| 207  | Multi-Status (WebDAV; [RFC 4918](https://tools.ietf.org/html/rfc4918)) |
| 208  | Already Reported (WebDAV; [RFC 5842](https://tools.ietf.org/html/rfc5842)) |
| 226  | IM Used ([RFC 3229](https://tools.ietf.org/html/rfc3229)) |



### 3xx redirection

| Code | Meaning                                                      |
| ---- | ------------------------------------------------------------ |
| 300  | Multiple Choices                                             |
| 301  | Moved Permanently                                            |
| 302  | Found(Previously "Moved temporarily")                        |
| 303  | See Other(since HTTP/1.1)                                    |
| 304  | Not Modified ([RFC 7232](https://tools.ietf.org/html/rfc7232)) |
| 305  | Use Proxy (since HTTP/1.1)                                   |
| 306  | Switch Proxy                                                 |
| 307  | Temporary Redirect (since HTTP/1.1)                          |
| 308  | Permanent Redirect ([RFC 7538](https://tools.ietf.org/html/rfc7538)) |



### 4xx client errors

| Code | Meaning                                                      | Desc                                                         |
| ---- | ------------------------------------------------------------ | ------------------------------------------------------------ |
| 400  | Bad Request                                                  | The server cannot or will not process the request due to an apparent client error,<br />e.g., malformed request syntax, size too large, invalid request message framing, or deceptive request routing |
| 401  | Unauthorized ([RFC 7235](https://tools.ietf.org/html/rfc7235)) |                                                              |
| 402  | Payment Required                                             |                                                              |
| 403  | Forbidden                                                    |                                                              |
| 404  | Not Found                                                    |                                                              |
| 405  | Method Not Allowed                                           |                                                              |
| ...  |                                                              |                                                              |



### 5xx server errors

| Code | Meaning                    | Desc                                                         |
| ---- | -------------------------- | ------------------------------------------------------------ |
| 500  | Internal Server Error      |                                                              |
| 501  | Not Implemented            |                                                              |
| 502  | Bad Gateway                | The server was acting as a [gateway](https://en.wikipedia.org/wiki/Gateway_(telecommunications)) or proxy and received an invalid response from the upstream server. |
| 503  | Service Unavailable        |                                                              |
| 504  | Gateway Timeout            | The server was acting as a gateway or proxy and did not receive a timely response from the upstream server. |
| 505  | HTTP Version Not Supported |                                                              |
| ...  |                            |                                                              |



## 参考

1. [List of HTTP status codes](https://en.wikipedia.org/wiki/List_of_HTTP_status_codes)