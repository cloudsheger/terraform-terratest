### Prerequisite: install Go.
To add Terratest to your projects, we recommend using a Go dependency manager such as
dep to add the packages you wish to use (see package by package overview for the list). For example, to add the terraform package:

```
dep ensure -add github.com/gruntwork-io/terratest/modules/terraform
```

Alternatively, you can use go get:

```
go get github.com/gruntwork-io/terratest/modules/terraform
```

### The basic usage pattern for writing automated tests with Terratest is to:

Write tests using Go's built-in package testing: you create a file ending in
_test.go and run tests with the go test command.
Use Terratest to execute your real IaC tools (e.g., Terraform, Packer, etc.) to deploy real infrastructure
(e.g., servers) in a real environment (e.g., AWS).
Validate that the infrastructure works correctly in that environment by making HTTP requests, API calls, SSH
connections, etc.
Undeploy everything at the end of the test.

## Fist time user
```
mkdir hello # Alternatively, clone it if it already exists in version control.
$ cd hello
$ go mod init example/user/hello
go: creating new go.mod: module example/user/hello
$ cat go.mod
module example/user/hello

go 1.20
$
```
## Next, create a file named hello.go inside that directory containing the following Go code:

```
package main

import "fmt"

func main() {
    fmt.Println("Hello, world.")
}

```
## Now you can build and install that program with the go tool:

```
$ go install example/user/hello
```
# run test
```
go test
```