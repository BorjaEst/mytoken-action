# mytoken-docker-action

Github Action to obtain an OIDC access token form a MyToken secret

## Inputs

## `my-token`

**Required** The MyToken secret name.

## Outputs

## `access-token`

The OIDC access token to be used in the workflow.

## Example usage

```yaml
uses: BorjaEst/mytoken-docker-action@0.0.1
with:
  my-token: ${{ secrets.MYTOKEN }}
```
