## Data Source and Staging

This project uses the NYC Citi Bike trip history dataset and loads the raw CSV files into a Snowflake internal stage for further processing and analysis.

### Dataset

Citi Bike system data:

https://citibikenyc.com/system-data

Download the historical Citi Bike trip datasets:

https://s3.amazonaws.com/tripdata/index.html

The raw dataset files are not stored in this GitHub repository because of their large size.

---

## SnowSQL

The local Citi Bike files are uploaded to Snowflake using SnowSQL and the Snowflake `PUT` command.

SnowSQL download:

https://www.snowflake.com/en/developers/downloads/snowsql/

Snowflake documentation for the `PUT` command:

https://docs.snowflake.com/en/sql-reference/sql/put#examples

---

## Extracting the Dataset

The downloaded Citi Bike data contains multiple ZIP files. These can be extracted automatically instead of unzipping every folder manually.

### Windows PowerShell

Navigate to the parent directory containing the downloaded ZIP files and run:

```powershell
Get-ChildItem -Path . -Recurse -Filter *.zip |
ForEach-Object {
    Expand-Archive `
        -Path $_.FullName `
        -DestinationPath ($_.DirectoryName + "\" + $_.BaseName) `
        -Force
}
```

### macOS / Linux

From the parent folder containing the downloaded ZIP files:

```bash
find . -name "*.zip" -exec sh -c '
for zip; do
    dir="${zip%.zip}"
    mkdir -p "$dir"
    unzip -o "$zip" -d "$dir"
done
' _ {} +
```

---

## Create the Snowflake Stage

An internal Snowflake stage is created to temporarily store the raw Citi Bike CSV files.

```sql
CREATE OR REPLACE STAGE DEMO.DEMO_SCHEMA.BIKE_STAGE;
```

---

## Upload Files to Snowflake

The files are uploaded from the local machine using the Snowflake `PUT` command.

Example:

```sql
PUT 'file:///C:/Users/YOUR_USERNAME/Downloads/2023-citibike-tripdata/*/*.csv'
    @BIKE_STAGE;
```

Replace the local path with the directory where the Citi Bike dataset was extracted.

For example, the wildcard:

```text
*/*.csv
```

allows SnowSQL to search the monthly subfolders and upload all CSV files.

The local machine path is intentionally not hard-coded in the project SQL scripts because it will be different for every user.

---

## Verify the Upload

After uploading the files, the contents of the Snowflake stage can be checked with:

```sql
LIST @BIKE_STAGE;
```

This should return the CSV files stored inside the internal Snowflake stage.

---

## Data Flow

```text
Citi Bike Website
       ↓
ZIP Files
       ↓
Extracted CSV Files
       ↓
SnowSQL PUT
       ↓
Snowflake BIKE_STAGE
       ↓
Snowflake Raw Table
       ↓
Transformation / Analysis
```
