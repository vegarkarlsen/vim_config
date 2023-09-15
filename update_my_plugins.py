try:
    import concurrent.futures as futures
except ImportError:
    try:
        import futures
    except ImportError:
        futures = None

import re
import shutil
import tempfile
import urllib.request
import zipfile
from io import BytesIO
from os import path

# --- my_plugins ----------------------------------------------
PLUGINS = """
onedark.vim https://github.com/joshdick/onedark.vim
vim-polyglot https://github.com/sheerun/vim-polyglot
""".strip()

GITHUB_ZIP = "%s/archive/master.zip"

SOURCE_DIR = path.join(path.dirname(__file__), "my_plugins")


def download_extract_replace(plugin_name, zip_path, temp_dir, source_dir):
    # Download and extract file in temp dir
    with urllib.request.urlopen(zip_path) as req:
        zip_f = zipfile.ZipFile(BytesIO(req.read()))
        zip_f.extractall(temp_dir)
        content_disp = req.headers.get("Content-Disposition")

    filename = re.findall("filename=(.+).zip", content_disp)[0]
    plugin_temp_path = path.join(temp_dir, path.join(temp_dir, filename))

    # Remove the current plugin and replace it with the extracted
    plugin_dest_path = path.join(source_dir, plugin_name)

    try:
        shutil.rmtree(plugin_dest_path)
    except OSError:
        pass

    shutil.move(plugin_temp_path, plugin_dest_path)
    print("Updated {0}".format(plugin_name))


def update(plugin):
    name, github_url = plugin.split(" ")
    zip_path = GITHUB_ZIP % github_url
    try:
        download_extract_replace(name, zip_path, temp_directory, SOURCE_DIR)
    except Exception as exp:
        print("Could not update {}. Error was: {}".format(name, str(exp)))


if __name__ == "__main__":
    temp_directory = tempfile.mkdtemp()

    try:
        if futures:
            with futures.ThreadPoolExecutor(16) as executor:
                executor.map(update, PLUGINS.splitlines())
        else:
            [update(x) for x in PLUGINS.splitlines()]
    finally:
        shutil.rmtree(temp_directory)
