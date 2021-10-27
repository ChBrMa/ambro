workspace "ambro"
    architecture "x64"
   -- startproject "Sandbox"
    configurations {
        "Debug",
        "Release",
        "Dist"
    }

outputdir = "%{cfg.buildcfg}-%{cfg.system}-%{cfg.architecture}"

project "ambro"
    location "ambro"
    kind "SharedLib"
    language "C++"

    targetdir ("bin/" .. outputdir .. "/%{prj.namne}")
    objdir ("bin-obj/" .. outputdir .. "/%{prj.namne}")

    files {
        "%{prj.name}/src/**.h",
        "%{prj.name}/src/**.hpp",
        "%{prj.name}/src/**.cpp",
        "%{prj.name}/src//**.c"
    }

    includedirs {
        "%{prj.name}/src"
    }

    filter "system:windows"
        cppdialect "C++20"
        staticruntime "On"
        systemversion "latest"

        defines {
            "amb_BUILD_DLL",
            "amb_PLAT_WIN"
        }
        postbuildcommands{
            ("{COPY} %{cfg.buildtarget.relpath} ../bin/" .. outputdir .. "/Sandbox")
        }

    filter "configurations:Debug"
        defines "amb_DEBUG"
        symbols "On"
    filter "configurations:Release"
        defines "amb_RELEASE"
        optimize "On"
    filter "configurations:Dist"
        defines "amb_DIST"
        optimize "On"

project "Sandbox"
location "Sandbox"
kind "ConsoleApp"
language "C++"

targetdir ("bin/" .. outputdir .. "/%{prj.namne}")
objdir ("bin-obj/" .. outputdir .. "/%{prj.namne}")

files {
    "%{prj.name}/src/**.h",
    "%{prj.name}/src/**.hpp",
    "%{prj.name}/src/**.cpp"
}

links{
    "ambro"
}

includedirs {
    "ambro/src"
}

filter "system:windows"
    cppdialect "C++20"
    staticruntime "On"
    systemversion "latest"

    defines {
        "RN_BUILD_DLL",
        "RN_PLAT_WIN"
    }