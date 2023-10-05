# CombineTestableNetwork

## Example 

### Inject Fail
```swift
let userNetwork = UserNetwork(session: URLSession.mockSession)

func test_fail로_빠져서_Nil이_할당되는_경우() throws {
    Task {
        let result = try? await userNetwork.getUser(username: "insub4067")
            .mock(.fail(NetworkError.statusCode(500)))
            .asyncThrows
        XCTAssertNil(result)
    }
}
```

### Inject Model
```swift
let userNetwork = UserNetwork(session: URLSession.mockSession)

func test_success로_빠져서_User가_할당되는_경우() throws {
    let expectedResult = User(login: "isnub4067", url: "https://github.com/insub4067")
    Task {
        let result = try? await userNetwork.getUser(username: "insub4067")
            .mock(.success(expectedResult))
            .asyncThrows
        XCTAssertNotNil(result)
        if let result {
            XCTAssertEqual(expectedResult.login, result.login)
        }
    }
}
```
