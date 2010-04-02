<plugin>
	<name>Username Restrictions</name>
	<!-- the package value becomes a part of the directory name where the plugin is installed. -->
	<package>UsernameRestrictions</package>
	<version>1.0</version>
	<provider>Seb Duggan</provider>
	<providerURL>http://sebduggan.com</providerURL>
	<category>Utility</category>
	<settings>
		<setting>
			<name>MinimumLength</name>
			<label>Minimum username length</label>
			<hint>Require a username to be at least this many characters long</hint>
			<type>text</type>
			<required>true</required>
			<validation>numeric</validation>
			<regex></regex>
			<message></message>
			<defaultvalue>0</defaultvalue>
			<optionlist></optionlist>
			<optionlabellist></optionlabellist>
		</setting>

		<setting>
			<name>ErrorLength</name>
			<label>Error message (minimum length)</label>
			<hint>Error message to show if username matches one of the restrictions. Use %% to display the minimum length.</hint>
			<type>text</type>
			<required>true</required>
			<validation></validation>
			<regex></regex>
			<message></message>
			<defaultvalue>Your username must be at least %% characters long</defaultvalue>
			<optionlist></optionlist>
			<optionlabellist></optionlabellist>
		</setting>
		
		<setting>
			<name>RestrictedList</name>
			<label>Prohibited usernames (list)</label>
			<hint>Enter each username on a new line</hint>
			<type>textarea</type>
			<required>false</required>
			<validation></validation>
			<regex></regex>
			<message></message>
			<defaultvalue></defaultvalue>
			<optionlist></optionlist>
			<optionlabellist></optionlabellist>
		</setting>

		<setting>
			<name>RestrictedRegex</name>
			<label>Prohibited usernames (regular expressions)</label>
			<hint>Enter each regular expression on a new line</hint>
			<type>textarea</type>
			<required>false</required>
			<validation></validation>
			<regex></regex>
			<message></message>
			<defaultvalue>^.*admin.*$</defaultvalue>
			<optionlist></optionlist>
			<optionlabellist></optionlabellist>
		</setting>

		<setting>
			<name>onlyIfChanged</name>
			<label>Enforce only when username changed</label>
			<hint>If yes, then restrictions will not be enforced when a user updates his/her profile but doesn't change username</hint>
			<type>select</type>
			<required>true</required>
			<validation></validation>
			<regex></regex>
			<message></message>
			<defaultvalue>1</defaultvalue>
			<optionlist>1^0</optionlist>
			<optionlabellist>Yes^No - always enforce</optionlabellist>
		</setting>

		<setting>
			<name>ErrorRestricted</name>
			<label>Error message (restrcicted)</label>
			<hint>Error message to show if username matches one of the restrictions</hint>
			<type>text</type>
			<required>true</required>
			<validation></validation>
			<regex></regex>
			<message></message>
			<defaultvalue>You have chosen a restricted username. Please try another...</defaultvalue>
			<optionlist></optionlist>
			<optionlabellist></optionlabellist>
		</setting>
	</settings>

	<eventHandlers>
		<eventHandler event="onBeforeUserSave" component="eventHandlers.username" persist="false"/>
	</eventHandlers>

	<displayobjects/>
</plugin>
