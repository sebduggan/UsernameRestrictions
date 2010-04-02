<cfinclude template="plugin/config.cfm" />
<cfsavecontent variable="body">
<cfoutput>
<h2>#request.pluginConfig.getName()#</h2>
<p>
	This plugin gives you more control over the usernames your users can choose.
	While it doesn't really matter if it's just for them to log in to the site, when
	you start to display them publicly - for example, if you're hosting forums - you
	will want to restrict what people can call themselves.
</p>
<p>
	For example, you probably don't want anyone else pretending to be an administrator.
	(This is the default restriction - no username can contain the word "admin"). You might
	also want to block use of your company or product name.
</p>
<p>
	There are two lists of restrictions, both with a single restriction per line. The first,
	a plain text list, simply checks the whole username against the entries in the list.
</p>
<p>
	The second is a list of regular expressions. If the username matched any regular expression
	in the list, it will be blocked. See the default admin entry for an example:<br />
	<strong>^.*admin.*$</strong>
</p>
<p>
	You can also limit the minimum length of a username. By default, this is set to zero (no
	minimum length), but you might want, for example, to have no usernames of fewer than 4
	characters.
</p>
<p>
	Finally, because you may already have users registered who violate these rules, you can choose
	whether the rules are enforced when they update their profile without amending the username.
	(if they change the username, the rules will always be enforced).
</p>

<h3>Use on multiple sites</h3>
<p>
	Each installation of the plugin has its own settings. So if you have a number of sites, all of
	which will use the same rules, then simply activate that plugin for each of those sites.
</p>
<p>
	But if you wish to have different rule sets, you will need to install a second instance of the
	plugin, and simply assign each instance to different sites (or groups of sites). If you do this,
	you will probably also want to set a plugin alias for each instance, just to avoid confusion.
</p>
</cfoutput>
</cfsavecontent>
<cfoutput>
#application.pluginManager.renderAdminTemplate(body=body,pageTitle=request.pluginConfig.getName())#
</cfoutput>