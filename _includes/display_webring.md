{% if include.sim == "true" %}
{% if include.sim_type == "bad" %}
<div id="critter-webring-nav-simulated-bad"></div>
<script>
    const xwebringElement = document.getElementById("critter-webring-nav-simulated-bad");
    xwebringElement.innerHTML = `<code>Error: This website does not belong to the webring: {{page.name}}</code><br />
    <p>Please see <a style="color: inherit;" href="{{site.url}}/rings/{{include.slug}}" target="_blank">{{page.name}}</a> for details.</p>`;
    xwebringElement.style = `margin: 5px; padding: 15px; background: red; color: white; font-weight: 800; border-radius: 5px; text-shadow: 1px 1px black;`;
</script>
{% else %}
<div id="critter-webring-nav-simulated-good"></div>
<script>
    const zhere = new URL(window.location.href);
    const zwebringElement = document.getElementById("critter-webring-nav-simulated-good");
    fetch(`{{site.url}}/api/rings/{{include.slug}}.json`).then((res) => res.json()).then(data => {
        let zringSlug = data.slug;
        let zringMembers = data.members;
        zringMembers.push({link: new URL(`{{site.url}}`), name: "Simulated", description: "Not for production"}); // for simulation purposes
        let zringMembersLinksHosts = zringMembers.map(i => (new URL(i.link).host.toLowerCase()));

        if (!zringMembersLinksHosts.includes(zhere.host.toLowerCase())){
            zwebringElement.innerHTML = `<code>Error: This website does not belong to the webring: {{page.name}}</code><br />
            <p>Please see <a style="color: inherit;" href="{{site.url}}/rings/{{include.slug}}" target="_blank">{{page.name}}</a> for details.</p>`;
            zwebringElement.style = `margin: 5px; padding: 15px; background: red; color: white; font-weight: 800; border-radius: 5px; text-shadow: 1px 1px black;`;
            return;
        }
        
        let zmyPositionInRing = zringMembers.findIndex(item => new URL(item.link).host.toLowerCase() === zhere.host.toLowerCase());
        let zprevInRing = zringMembers[(zmyPositionInRing - 1 + zringMembers.length) % zringMembers.length]
        let znextInRing = zringMembers[(zmyPositionInRing + 1) % zringMembers.length]

        const zwebringNavInnerHtml = `
<div>
    <p>{{page.name}}</p>
    <div>
        <span><a href="{{site.url}}/rings/{{include.slug}}?name=Simulated&to=prev" target="_blank">previous</a></span>
        <span><a href="{{site.url}}/rings/{{include.slug}}" target="_blank">info</a></span>
        <span><a href="{{site.url}}/rings/{{include.slug}}?name=Simulated&to=prev" target="_blank">next</a></span>
    </div>
</div>
`;
    zwebringElement.innerHTML = zwebringNavInnerHtml;
    })
</script>
{% endif %}
{% else %}
<div id="critter-webring-nav">
    <p>{{page.name}}</p>
    <div>
        <span><a href="{{site.url}}/rings/{{include.slug}}?name=Simulated&to=prev" target="_blank">previous</a></span>
        <span><a href="{{site.url}}/rings/{{include.slug}}" target="_blank">info</a></span>
        <span><a href="{{site.url}}/rings/{{include.slug}}?name=Simulated&to=next" target="_blank">next</a></span>
    </div>
</div>
{% endif %}