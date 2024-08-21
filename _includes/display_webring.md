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
        <span><a href="${zprevInRing.link}">previous</a></span>
        <span><a href="{{site.url}}/rings/{{include.slug}}">info</a></span>
        <span><a href="${znextInRing.link}">next</a></span>
    </div>
</div>
`;
    zwebringElement.innerHTML = zwebringNavInnerHtml;
    })
</script>
{% endif %}
{% else %}
<div id="critter-webring-nav"></div>
<script>
    const here = new URL(window.location.href);
    const webringElement = document.getElementById("critter-webring-nav");
    fetch(`{{site.url}}/api/rings/{{include.slug}}.json`).then((res) => res.json()).then(data => {
        let ringSlug = data.slug;
        let ringMembers = data.members;

        if (ringMembers.length === 0) {
            webringElement.innerHTML = `<code>Error: This webring is empty: {{page.name}}</code><br />
            <p>Please see <a style="color: inherit;" href="{{site.url}}/rings/{{include.slug}}" target="_blank">{{page.name}}</a> for details.</p>`;
            webringElement.style = `margin: 5px; padding: 15px; background: red; color: white; font-weight: 800; border-radius: 5px; text-shadow: 1px 1px black;`;
            return;
        }

        let ringMembersLinksHosts = ringMembers.map(i => (new URL(i.link).host.toLowerCase()));

        if (!ringMembersLinksHosts.includes(here.host.toLowerCase())){
            webringElement.innerHTML = `<code>Error: This website does not belong to the webring: {{page.name}}</code><br />
            <p>Please see <a style="color: inherit;" href="{{site.url}}/rings/{{include.slug}}" target="_blank">{{page.name}}</a> for details.</p>`;
            webringElement.style = `margin: 5px; padding: 15px; background: red; color: white; font-weight: 800; border-radius: 5px; text-shadow: 1px 1px black;`;
            return;
        }
        
        let myPositionInRing = ringMembers.findIndex(item => new URL(item.link).host.toLowerCase() === here.host.toLowerCase());
        let prevInRing = ringMembers[(myPositionInRing - 1 + ringMembers.length) % ringMembers.length]
        let nextInRing = ringMembers[(myPositionInRing + 1) % ringMembers.length]

        const webringNavInnerHtml = `
<div>
    <p>{{page.name}}</p>
    <div>
        <span><a href="${prevInRing.link}">previous</a></span>
        <span><a href="{{site.url}}/rings/{{include.slug}}">info</a></span>
        <span><a href="${nextInRing.link}">next</a></span>
    </div>
</div>
`;

    webringElement.innerHTML = webringNavInnerHtml;
    })
</script>
{% endif %}