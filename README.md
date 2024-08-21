# Critter Webring
> A silly lil webring system ~~mangled together with~~ created using Jekyll.

## Available Rings:

See [_rings](/_rings/)

## Join a Ring

Open a PR to add yourself to [_data/sites.yml](_data/sites.yml):

```yml
- name: Your Site Name Here
  link: "hxxps://your-site-link.here"
  description: |
    A short (1-2 sentence max) description of your site, if you'd like to include one
  rings:
    - critters  # or, if this expands to multiple rings, include one or more ring slugs here
```

If you are already in this and wish to join multiple rings, simply open a PR and add to the rings slug list.

## Leave a Ring

Above, in reverse. Create a PR that removes yourself from the links, or from one specific ring if you're in multiple.

## Create a New Ring

1. Create `_rings/new-ring-slug.md`

```yml
---
slug: 'new-ring-slug'
name: 'The Text Title for the Ring'
description: 'A short description of the purpose of the webring'
layout: ring
---
```

2. Create `api/rings/new-ring-slug.json`

```json
---
layout: ring
permalink: /api/rings/new-ring-slug.json
slug: new-ring-slug
---

{% assign page.url = "/api/rings/new-ring-slug.json" %}
```

3. Edit `_config.yml`'s `permalinks` key to include a mapping for the API version of the data:

```yml
#...
permalinks:
    # ...
    api_rings_new_ring_slug: "/api/rings/new-ring-slug.json"
    # ...
#...
```
