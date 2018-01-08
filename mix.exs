defmodule ExPerHash.Mixfile do
  use Mix.Project

  def project do
    [app: :experhash,
      name: "ExPerHash",
     version: "0.1.0",
     elixir: "~> 1.0",
     build_embedded: Mix.env == :prod,
     start_permanent: Mix.env == :prod,
     compilers: [:make, :elixir, :app],
     aliases: aliases(),
     deps: deps()]
  end

  def application do
    [applications: [:logger, :cure]]
  end

  defp aliases do
    [clean: ["clean", "clean.make"]]
  end

  defp deps do
    [{:cure, "~> 0.5.0"}]
  end
end

defmodule Mix.Tasks.Compile.Make do
  @shortdoc "Compile C++ code"
  use Mix.Task
   
  def run(_) do
    ## for windows install GNUWin32 to compile
    {result, _error_code} = System.cmd("make", [], stderr_to_stdout: true) 
    Mix.shell.info result
    
    :ok
  end
end
  
defmodule Mix.Tasks.Clean.Make do
  @shortdoc "Delete generated C++ files"
  use Mix.Task

  def run(_) do
    {result, _error_code} = System.cmd("make", ['clean'], stderr_to_stdout: true)
    Mix.shell.info result
    
    :ok
  end
end

