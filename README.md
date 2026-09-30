# School Projects for the Fall 2026 Semester

## Assembly (CIS 11)

### Running Assembly Code

Going with a docker-based solution from my home machine for this semester.

Running it:

```
docker start -ai asm-dev
```

Building the docker image:

```
docker run -it \
  -v ~/repos/school_projects_fall_2026:/workspace \
  --name asm-dev \
  asm-env
```
