# Getting JSON response from HTTP Get

```go
func Fetch(id uuid.UUID, target interface{}) error {
	url := RootUrl + "/" + id.String()

	fmt.Println("Fetching an account details (" + id.String() + ") ...")

	r, err := httpClient.Get(url)
	if err != nil {
		return err
	}

	defer r.Body.Close()
	return json.NewDecoder(r.Body).Decode(target)
}

// main.go
getAccountResponse := new(models.CreateAccountResponse)
	fetchError := accountService.Fetch(accountId, getAccountResponse)
	if fetchError != nil {
		fmt.Printf("The HTTP request failed with error %s\n", fetchError)
		return
	}

```
