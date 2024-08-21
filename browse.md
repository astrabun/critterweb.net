---
layout: default
permalink: /rings/
title: Browse
---

## The Critter Web

## Browse Rings

<ul>
    {% for ring in site.rings %}
        <li>
            <div style="display: flex; flex-direction: column;">
                <span><a href="/rings/{{ ring.slug }}">{{ ring.name }}</a></span>
                <span style="font-size: smaller">{{ ring.description }}</span>
            </div>
        </li>
    {% endfor %}
</ul>