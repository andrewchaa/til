# Creating HTTP Request in Go


```go
package accountService

import (
	"bytes"
	"encoding/json"
	"net/http"

	"github.com/andrewchaa/form3client/models"
	uuid "github.com/satori/go.uuid"
)

const RootUrl = "http://localhost:8080/v1/organisation/accounts"

func Create(accountId uuid.UUID,
	organisationId uuid.UUID,
	country string,
	baseCurrency string,
	bankId string,
	bankIdCode string,
	bic string) (*http.Response, error) {

	createAccountRequest := models.CreateAccountRequest{
		Data: models.CreateAccountRequestData{
			Type:           "accounts",
			Id:             accountId.String(),
			OrganisationId: organisationId.String(),
			Attributes: models.CreateAccountRequestAttributes{
				Country:      country,
				BaseCurrency: baseCurrency,
				BankId:       bankId,
				BankIdCode:   bankIdCode,
				Bic:          bic,
			},
		},
	}

	payloadBuf := new(bytes.Buffer)
	json.NewEncoder(payloadBuf).Encode(createAccountRequest)

	req, _ := http.NewRequest("POST", RootUrl, payloadBuf)

	client := &http.Client{}
	return client.Do(req)
}

func Fetch(id uuid.UUID) (*http.Response, error) {
	url := RootUrl + "/" + id.String()
	return http.Get(url)
}

func Delete(id uuid.UUID) (*http.Response, error) {
	url := RootUrl + "/" + id.String()
	req, _ := http.NewRequest("DELETE", url, nil)

	client := &http.Client{}
	return client.Do(req)
}
```
