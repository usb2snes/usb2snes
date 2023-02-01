---
# Feel free to add content and custom Front Matter to this file.
# To modify the layout, see https://jekyllrb.com/docs/themes/#overriding-theme-defaults

layout: page
---


<style type="text/css">
        dl {
            display: grid;
            grid-template-columns: 1fr 3fr;
            border: solid;
            border-width: 1px;
            border-color: lightgray;
            margin-top: 0px;
            margin-bottom: 0px;
        }
        dl:not(:last-of-type) {
            border-bottom: none;
        }
        dl:hover {
            background-color: whitesmoke;
        }
        dt {
            font-weight: bold;
            margin-left: 10px;
            margin-top: 5px;
            margin-bottom: 5px;
        }
        .appicon {
            width: 20px;
            height: 20px;
        }
</style>

{% for application in site.data.list-apps %}
<dl>
        <dt>Name</dt>
        <dd>{% if application.icon != "" %}<img class="appicon" src="{{ application.icon }}"/>{% endif %}{{ application.name }}</dd>
        <dt>Author</dt>
        <dd>{{ application.author }}</dd>
        <dt>Short description</dt>
        <dd>{{ application.short-description }}</dd>
        <dt>Description</dt>
        <dd>{{ application.description }}</dd>
        <dt>Website</dt>
        <dd><a href="{{ application.website }}">{{ application.website }}</a></dd>
        <dt>Screenshot</dt>
        <dd>{% if application.screenshot != "" %}
            <a href="{{ application.screenshot }}">See screenshot</a>
            {% else %}
            -
            {% endif %}
        </dd>
</dl>

{% endfor %}