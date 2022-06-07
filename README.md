
## placeholder for permanent db backup

```mermaid
sequenceDiagram
    participant dotcom
    participant iframe
    participant viewscreen
    dotcom->>iframe: loads html w/ iframe url
    iframe->>viewscreen: request template
    viewscreen->>iframe: html & javascript
    iframe->>dotcom: iframe ready
    dotcom->>iframe: set mermaid data on iframe
    iframe->>iframe: render mermaid
```
#### PRD
- Different hosts can be added as folders here
- Should stay current with production
- Including the keys, index folders
#### QA 
- Different hosts can be added as folders here
- Should stay current with qa
- Including the keys, index folders
#### NEED TO FIGURE OUT A WAY TO PUT DB DETAILS IN GRAFANA
