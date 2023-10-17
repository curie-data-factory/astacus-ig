# Astacus IG



## Building the IG

"Building" the IG means generating a web-based, human-readable representation of the structured information and accompanying documentation defined within this repository. This is done via the [FHIR Implementation Guide Publisher](https://confluence.hl7.org/display/FHIR/IG+Publisher+Documentation) ("IG Publisher"), a Java program provided by the FHIR team for building IGs into a standardized presentation.

If you would like to generate this locally, open command prompt window and navigate to the directory where this repository has been cloned. Then run this command:

- Linux/macOS: `./gradlew buildIG`
- Windows: `.\gradlew.bat buildIG`

Astacus IG is developed in [FHIR Shorthand (FSH)](http://build.fhir.org/ig/HL7/fhir-shorthand/), a domain-specific language (DSL) for defining the content of FHIR IGs. SUSHI complies FHS files into the JSON files expected by the IG Publisher.

You will need an active internet connection to build the IG. It makes take up to 30 minutes to build for the first time; subsequent builds should be faster (5-7 minutes) on a modern laptop.

When the build finishes, you can open `output/index.html` in your browser to see the locally built IG.

### Dependencies for building the IG

1. You will need to [install java](https://adoptium.net/)
2. You will need to [install jekyll](https://jekyllrb.com/docs/installation/)

### Running SUSHI independently of the IG Publisher

If you want to run SUSHI without building the entire IG, you can run a gradle task `runSushi`.

### Getting a clean build

While not normally necessary, you can delete the following folders to get a clean build:

- `fsh-generated/` (SUSHI output)
- `output/` (IG Publisher output)
- `input-cache/` (IG Publisher local cache; note that deleting this will dramatically increase the length of the next build)

## Key folders & files in the IG

- The FHIR Shorthand (`.fsh`) files defining the resources in this IG are found in `input/fsh/`.
    - There is an [FSH syntax highlighting extension](https://marketplace.visualstudio.com/items?itemName=kmahalingam.vscode-language-fsh) for [VSCode](https://code.visualstudio.com). The mCODE team generally uses this set of tools for working on FSH files.
    - The FSH files are prefixed based on what is contained inside.

| Prefix | Description          |
|--------|----------------------|
| `AL`   | Aliases              |
| `DEF`  | Other Definitions    |
| `EX`   | Examples             |
| `SD`   | StructureDefinitions |
| `VS`   | ValueSets            |

- The main pages in the built IG are generated from [Markdown](https://daringfireball.net/projects/markdown/) found in `input/pagecontent/`. These pages must also be included in `sushi-config.yaml` to be compiled to HTML by the IG Publisher.
- There are a number of other important configuration options in `sushi-config.yaml` including the menu contents of the built IG and the groupings on the [Artifacts Summary page](https://aphp.fr/ig/fhir-astacus-ig/artifacts.html).
- The source for the UML diagrams in the IG are found in `input/images-source/` and MUST have a `.plantuml` extension. These are automatically converted to SVG by the IG Publisher, and are inserted inline into Markdown files using `{%include some-diagram.svg%}` (which corresponds to `input/images-source/some-diagram.plantuml`).

## Troubleshooting

### Structure Definition is Missing Snapshot Error

Some non-HL7 FHIR packages are distributed without snapshot elements in their profiles. If your IG uses one of these profiles, SUSHI will report an error like the following:

Structure Definition http://interopsante.org/fhir/StructureDefinition/FrPatient is missing snapshot. Snapshot is required for import.

Since SUSHI does not implement its own snapshot generator, you must update the package in your FHIR cache so that its profiles include snapshot elements. Fortunately, the [Firely Terminal](https://fire.ly/products/firely-terminal/) provides a way to do this.

First, you must install [Firely Terminal](https://docs.fire.ly/projects/Firely-Terminal/InstallingFirelyTerminal.html). Then use Firely Terminal to populate the snapshot elements in the dependency package.

1. Run the command: fhir install <package> (<version>), substituting the dependency package ID for <package>. 
   E.g., fhir install hl7.fhir.fr.core 1.1.0
2. Run SUSHI again. The error about missing snapshots should no longer be displayed.
