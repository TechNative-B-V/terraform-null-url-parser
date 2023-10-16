package test

import (
	"testing"
	"github.com/gruntwork-io/terratest/modules/terraform"
	"github.com/stretchr/testify/assert"
)

func TestUrl(t *testing.T) {
	t.Parallel()

	// retryable errors in terraform testing.
	terraformOptions := terraform.WithDefaultRetryableErrors(t, &terraform.Options{
		TerraformDir: "./",
	})

	defer terraform.Destroy(t, terraformOptions)

	terraform.InitAndApply(t, terraformOptions)

//	input_url := terraform.Output(t, terraformOptions, "input_url")
	input_url := "https://example.io/namespaces/TechNative-B-Vxxx"
	output_url := terraform.Output(t, terraformOptions, "output_url")

	assert.Equal(t, input_url, output_url)
}
