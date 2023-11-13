--- @diagnostic disable: lowercase global

ignore = {
	"111", -- setting non standard global variable
	"212/_.*", -- unused argument, for vars with _ prefix
	"214", -- unused variable with unused hint (_, prefix)
	"121", -- setting read only global variable 'vim'
	"122", -- setting read only field for global variable 'vim'
}

-- Global object defined by the c code
read_globals = {
	"vim",
}
