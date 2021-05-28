# Azure Devops Pipeline hierachy

In the simplest case, a pipeline has a single job. In that case, you don't have to explicitly use the `job`

```yaml
pool:
  vmImage: 'ubuntu-16.04'
steps:
- bash: echo "Hello world"
```

If you want to specify additional properties, use the `job` keyword

```yaml
jobs:
- job: myJob
  timeoutInMinutes: 10
  pool:
    vmImage: 'ubuntu-16.04'
  steps:
  - bash: echo "Hello world"
 ```

Use the `jobs` keyword if your pipeline has multiple jobs.

```yaml
jobs:
- job: A
  steps:
  - bash: echo "A"

- job: B
  steps:
  - bash: echo "B"
```

Finally, if the pipeline has multiple stages, use the `stages` keyword

```yaml
stages:
- stage: A
  jobs:
  - job: A1
  - job: A2

- stage: B
  jobs:
  - job: B1
  - job: B2
```
