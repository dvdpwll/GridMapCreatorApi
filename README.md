# rails-api-grid-map-creator

The back end for the grid map creator application.

Front End: https://github.com/dvdpwll/GridMapCreator
Deployed Front End: https://dvdpwll.github.io/GridMapCreator/
Deployed Back End: https://murmuring-harbor-68088.herokuapp.com/



# API end-points

| Verb   | URI Pattern                    | Controller#Action     |
| ------ | ------------------------------ | --------------------- |
| POST   | `/sign-up`                     | `users#signup`        |
| POST   | `/sign-in`                     | `users#signin`        |
| DELETE | `/sign-out/:id`                | `users#signout`       |
| PATCH  | `/change-password/:id`         | `users#changepw`      |
| POST   | `/maps`                        | `maps#create`         |
| GET    | `/users/:user_id/maps`         | `users#maps#show`     |
| DELETE | `/maps/:id`                    | `maps#destroy`        |
| PATCH  | `/maps/:id`                    | `maps#update`         |
| POST   | `/elements`                    | `elements#create`     |
| GET    | `/maps/:map_id/elements`       | `maps#elements#index` |
| PATCH  | `/elements/:id`                | `elements#update`     |
| DELETE | `/maps/:map_id/elements/:e_id` | `elements#destroy`    |

# User Action

<table>
<tr>
  <th colspan="3">Request</th>
  <th colspan="2">Response</th>
</tr>
<tr>
  <th>Verb</th>
  <th>URI</th>
  <th>body</th>
  <th>Status</th>
  <th>body</th>
</tr>
<tr>
<td>POST</td>
<td>`/sign-up`</td>
<td><strong>credentials</strong></td>
<td>201, Created</td>
<td><strong>user</strong></td>
</tr>
<tr>
  <td colspan="3"></td>
  <td>400 Bad Request</td>
  <td><em>empty</em></td>
</tr>
<tr>
<td>POST</td>
<td>`/sign-in`</td>
<td><strong>credentials</strong></td>
<td>200 OK</td>
<td><strong>user w/token</strong></td>
</tr>
<tr>
  <td colspan="3"></td>
  <td>401 Unauthorized</td>
  <td><em>empty</em></td>
</tr>
<tr>
<td>DELETE</td>
<td>`/sign-out/:id`</td>
<td>empty</td>
<td>201 Created</td>
<td>empty</td>
</tr>
<tr>
  <td colspan="3"></td>
  <td>401 Unauthorized</td>
  <td><em>empty</em></td>
</tr>
<tr>
<td>PATCH</td>
<td>`/change-password/:id`</td>
<td><strong>passwords</strong></td>
<td>204 No Content</td>
<td><strong>user w/token</strong></td>
</tr>
<tr>
  <td colspan="3"></td>
  <td>400 Bad Request</td>
  <td><em>empty</em></td>
</tr>
</table>

### signup

The `create` action expects a *POST* of `credentials` identifying a new user to
 create, e.g. using `getFormFields`:

```html
<form>
  <input name="credentials[email]" type="text" value="an@example.email">
  <input name="credentials[password]" type="password" value="an example password">
  <input name="credentials[password_confirmation]" type="password" value="an example password">
</form>

```

or using `JSON`:

```json
{
  "credentials": {
    "email": "an@example.email",
    "password": "an example password",
    "password_confirmation": "an example password"
  }
}
```

The `password_confirmation` field is optional.

If the request is successful, the response will have an HTTP Status of 201,
 Created, and the body will be JSON containing the `id` and `email` of the new
 user, e.g.:

```json
{
  "user": {
    "id": 1,
    "email": "an@example.email"
  }
}
```

If the request is unsuccessful, the response will have an HTTP Status of 400 Bad
 Request, and the response body will be empty.

### signin

The `signin` action expects a *POST* with `credentials` identifying a previously
 registered user, e.g.:

```html
<form>
  <input name="credentials[email]" type="text" value="an@example.email">
  <input name="credentials[password]" type="password" value="an example password">
</form>
```

or:

```json
{
  "credentials": {
    "email": "an@example.email",
    "password": "an example password"
  }
}
```

If the request is successful, the response will have an HTTP Status of 200 OK,
 and the body will be JSON containing the user's `id`, `email`, and the `token`
 used to authenticate other requests, e.g.:

```json
{
  "user": {
    "id": 1,
    "email": "an@example.email",
    "token": "an example authentication token"
  }
}
```

If the request is unsuccessful, the response will have an HTTP Status of 401
 Unauthorized, and the response body will be empty.

### signout

The `signout` actions is a *DELETE* specifying the `id` of the user to sign out.

If the request is successful the response will have an HTTP status of 204 No
 Content.

If the request is unsuccessful, the response will have a status of 401
 Unauthorized.

### changepw

The `changepw` action expects a PATCH of `passwords` specifying the `old` and
 `new`.

If the request is successful the response will have an HTTP status of 204 No
 Content.

If the request is unsuccessful the reponse will have an HTTP status of 400 Bad
 Request.

---

The `sign-out` and `change-password` requests must include a valid HTTP header
 `Authorization: Token token=<token>` or they will be rejected with a status of
 401 Unauthorized.

 ## Map actions

All map action requests must include a valid HTTP headr `Authorization: Token
 token=<token>` or they will be rejected with a staus of 401 Unauthorized.

Maps are associated with users by a :user_id. Actions, other than update, will
only retrieve a map if the user associated with the `Authorization` header is
one of the users. If this requirement is unmet, the response will be 404
Not Found.

*Summary:*

<table>
<tr>
  <th colspan="3">Request</th>
  <th colspan="2">Response</th>
</tr>
<tr>
  <th>Verb</th>
  <th>URI</th>
  <th>body</th>
  <th>Status</th>
  <th>body</th>
</tr>
<tr>
<td>GET</td>
<td>`/users/:user_id/maps`</td>
<td>n/a</td>
<td>200, OK</td>
<td><strong>maps found</strong></td>
</tr>
<tr>
<td>POST</td>
<td>`/maps`</td>
<td>n/a</td>
<td>201, Created</td>
<td><strong>map created</strong></td>
</tr>
<tr>
  <td colspan="3">
  </td>
  <td>401 Unauthorized</td>
  <td><em>empty</em></td>
</tr>
<tr>
  <td colspan="3">
  </td>
  <td>400 Bad Request</td>
  <td><strong>errors</strong></td>
</tr>
<tr>
<td>PATCH</td>
<td>`/maps/:id`</td>
<td><em>empty</em></td>
<td>200, OK</td>
<td><strong>map updated</strong></td>
</tr>
<tr>
  <td colspan="3"></td>
  <td>400 Bad Request</td>
  <td><strong>errors</strong></td>
</tr>
<tr>
  <td colspan="3"></td>
  <td>400 Bad Request</td>
  <td><em>empty</em></td>
</tr>
</table>

### index

The `index` action is a *GET* that retrieves all the maps associated with a
 user.
The response body will contain JSON containing an array of games, e.g.:

```json
{
  "maps": [
    {
      "id": 1,
      "name": "Map Name",
      "user_id": 1
    },
    {
      "id": 2,
      "name": "Map Name2",
      "user_id": 1
    }
  ]
}
```

### create

The `create` action expects a *POST* with an empty body (e.g `''` or `'{}'` if
 JSON).
If the request is successful, the response will have an HTTP Status of 201
 Created, and the body will contain JSON of the created map:

 ```json
 {
   "maps": [
     {
       "id": 1,
       "name": "Map Name",
       "user_id": 1
     }
   ]
 }
 ```

If the request is unsuccessful, the response will have an HTTP Status of 400 Bad
 Request, and the response body will be JSON describing the errors.

### show

The `show` action is a *GET* specifing the `id` of the map to retrieve.
If the request is successful the status will be 200, OK, and the response body
 will contain JSON for the game requested, e.g.:

 ```json
 {
   "maps": [
     {
       "id": 1,
       "name": "Map Name",
       "user_id": 1
     }
   ]
 }
 ```

 ## Element actions

All element action requests must include a valid HTTP header `Authorization: Token
 token=<token>` or they will be rejected with a staus of 401 Unauthorized.

Element are associated with maps by a :map_id. Actions, other than update, will
only retrieve an element if the user associated with the `Authorization` header is
one of the maps. If this requirement is unmet, the response will be 404
Not Found.

*Summary:*

<table>
<tr>
  <th colspan="3">Request</th>
  <th colspan="2">Response</th>
</tr>
<tr>
  <th>Verb</th>
  <th>URI</th>
  <th>body</th>
  <th>Status</th>
  <th>body</th>
</tr>
<tr>
<td>GET</td>
<td>`/maps/:map_id/elements`</td>
<td>n/a</td>
<td>200, OK</td>
<td><strong>element found</strong></td>
</tr>
<tr>
<td>POST</td>
<td>`/element`</td>
<td>n/a</td>
<td>201, Created</td>
<td><strong>element created</strong></td>
</tr>
<tr>
  <td colspan="3">
  </td>
  <td>401 Unauthorized</td>
  <td><em>empty</em></td>
</tr>
<tr>
  <td colspan="3">
  </td>
  <td>400 Bad Request</td>
  <td><strong>errors</strong></td>
</tr>
<tr>
<td>PATCH</td>
<td>`/element/:id`</td>
<td><em>empty</em></td>
<td>200, OK</td>
<td><strong>element updated</strong></td>
</tr>
<tr>
  <td colspan="3"></td>
  <td>400 Bad Request</td>
  <td><strong>errors</strong></td>
</tr>
<tr>
  <td colspan="3"></td>
  <td>400 Bad Request</td>
  <td><em>empty</em></td>
</tr>
</table>

### index

The `index` action is a *GET* that retrieves all the elements associated with a
 map.
The response body will contain JSON containing an array of games, e.g.:

```json
{
  "elements": [
    {
      "id": 1,
      "thing": "rock",
      "order": 0,
      "map_id": 1
    },
    {
      "id": 2,
      "thing": "none",
      "order": 1,
      "map_id": 1
    }
  ]
}
```

### create

The `create` action expects a *POST* with an empty body (e.g `''` or `'{}'` if
 JSON).
If the request is successful, the response will have an HTTP Status of 201
 Created, and the body will contain JSON of the created map:

 ```json
 {
   "elements": [
     {
       "id": 9,
       "thing": "tree",
       "order": 6,
       "map_id": 1
     }
   ]
 }
 ```

If the request is unsuccessful, the response will have an HTTP Status of 400 Bad
 Request, and the response body will be JSON describing the errors.

### show

The `show` action is a *GET* specifing the `id` of the element to retrieve.
If the request is successful the status will be 200, OK, and the response body
 will contain JSON for the game requested, e.g.:

 ```json
 {
   "elements": [
     {
       "id": 100,
       "thing": "water",
       "order": 25,
       "map_id": 1
     }
   ]
 }
 ```


## [License](LICENSE)

Source code distributed under the MIT license. Text and other assets copyright
General Assembly, Inc., all rights reserved.
