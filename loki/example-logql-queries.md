# LogQL example queries for Loki

### All by default promtail job for docker

    {job="docker"}

### All logs for docker-compose.yml service container_name back-app
    
    {job="docker",service="back-app"}

### By parsed in logfmt level and email

    {job="docker",service=~"logg.+"} | logfmt | level = "info" | email = "bertrandharris@prosacco.info"

### By parsed in logfmt level and email by regex endings with .info

    {job="docker"} | logfmt | email =~ ".+@.+\\.info"
