
ClassData = (_class, data) ->
	data or= {}

	setmetatable data,
		__tostring: =>
			"<ClassData: #{_class}>"

	data

---
-- Homemade class system.
--
-- ## Differences with `class`
-- 
--   - __init instead of new
--   - `getmetatable(instance)` instead of `instance.__class`
--   - class constructor can be externally defined through __constructor.
--   - Instances can be called if `__call` is defined in its class.
--   - inheritance works with `__index`, and `__index` can be set to anything,
--  allowing dynamic inheritance or other forms of obtaining data. See Lua
--  metamethods for informations about __index.
--   - class variables are defined through the __class array, and not through
--  `@variable:` definitions.
--   - Constructor arguments are **always** tables.
--
-- ## Basic use
--
-- ```
--    MyClass = Class
--      __init: (arg) =>
--        self.value = arg.value or 42
--    
--    myInstance = MyClass value: 3.14
--    
--    print myInstance.value
--    -- 3.14
-- ```
-- FIXME
--
-- ## Methods
-- FIXME
-- ## __class
-- FIXME
-- ## __call
-- FIXME
-- ## __index
-- FIXME
-- 
-- @issue Some intense renaming MIGHT be necessary.
-- @issue This file will definitely require moar documentation. =|
---
Class = setmetatable {},
	---
	-- @return string
	__tostring: => "<Class>"

	---
	-- @return (Class) The new class.
	-- @param name (string) (Optional) Name of the class, as used for debug or print operations.
	-- @param def (table) Definition of the class’ properties.
	__call: (name, def) =>
		-- FIXME: Using debug may prove more useful.
		if type(name) == "table"
			def = name
		elseif type(name) == "string"
			def.__name or= name

		unless def.__tostring
			def.__tostring = =>
				"<#{def.__name or "(anonymous)"}>"

		unless def.__index
			def.__index = (key) =>
				value = rawget self, key

				if value
					return value

				value = def[key]

				if value
					return value

		__class = ClassData def, def.__class

		__class.__call or= def.__construct or (arg) =>
			if type(arg) == "nil"
				arg = {}
			elseif type(arg) != "table"
				error "Class received a non-table argument"

			instance = setmetatable {}, def

			if def.__init
				def.__init instance, arg

			instance

		__class.__index or= (key) =>
			value = rawget self, key

			if value
				return value

			__class = rawget self, "__class"
			if __class
				value = rawget __class, key

				if value
					return value

		-- erroring __new_index ?

		__class.__tostring or= =>
				"<Class: #{def.__name or "(anonymous)"}>"

		setmetatable def, __class

	---
	-- Object class for `__class`.
	--
	-- Basically, it gives `__class` a `__tostring` metamethod.
	__class_data: ClassData


Class

