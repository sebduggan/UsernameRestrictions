<cfcomponent extends="mura.plugin.pluginGenericEventHandler">

<cffunction name="onBeforeUserSave" output="false" returntype="any">
	<cfargument name="event" />

	<cfset var user = event.getValue("userBean") />
	<cfset var errors = user.getErrors() />
	<cfset var regex = "" />
	<cfset var cr = "#chr(10)##chr(13)#" />

	<cfif event.getCurrentUser().getValue("s2") eq 0>
	<!--- Don't apply restrictions if admin user is logged in --->
	
		<cfif not StructKeyExists(errors, "username")>
		<!--- If there's already a validation error for the username, stick with that --->
		
			<cfif not pluginConfig.getSetting("onlyIfChanged") or compareNoCase(user.getUsername(), event.getCurrentUser().getValue("username"))>
			<!--- If we're only validating when the username's been changed, check if it has been --->
			
				<cfif len(user.getUsername()) lt pluginConfig.getSetting("MinimumLength")>
				<!--- Username is below minimum length requirement --->
				
					<cfset errors.username = replace(pluginConfig.getSetting("ErrorLength"), "%%", pluginConfig.getSetting("MinimumLength")) />		
						
				<cfelseif listFindNoCase( pluginConfig.getSetting("RestrictedList"), user.getUsername(), cr )>
				<!--- Look for the username in the plain list --->
				
					<cfset errors.username = pluginConfig.getSetting("ErrorRestricted") />
					
				<cfelse>
				<!--- Check the username against list of regular expressions --->
				
					<cfloop list="#pluginConfig.getSetting("RestrictedRegex")#" index="regex" delimiters="#cr#">
						<cfif reFindNoCase(regex, user.getUserName())>
							<cfset errors.username = pluginConfig.getSetting("ErrorRestricted") />
							<cfbreak />
						</cfif>
					</cfloop>
					
				</cfif>
				
			</cfif>
		
		</cfif>
	
	</cfif>
</cffunction>

</cfcomponent>

