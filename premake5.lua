project "spdlog"
	kind "StaticLib"
	language "C++"
	cppdialect "C++20"

	targetdir ("%{wks.location}/bin/" .. outputdir .. "%{prj.name}")
	objdir ("%{wks.location}/obj/" .. outputdir .. "%{prj.name}")

	includedirs
	{
		"include"
	}

	files
	{
		"src/**.cpp",
		"src/**.h",
		"include/**.cpp",
		"include/**.h",
	}

	defines
	{
		"SPDLOG_COMPILED_LIB"
	}

	filter "system:windows"
		systemversion "latest"
		staticruntime "On"
		buildoptions { "/utf-8" }
		cppdialect "C++20"

	filter { "system:windows", "configurations:Debug" }
		runtime "Debug"
		symbols "on"

	filter { "system:windows", "configurations:Release" }
		runtime "Release"
		optimize "on"
		-- buildoptions "/MT"
