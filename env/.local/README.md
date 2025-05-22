# 🔐 age

## 🔐 Encrypt a file

```bash
./encrypt.sh <file> <output.age>
```

**Example:**

```bash
./encrypt.sh secrets.txt secrets.age
```

This will prompt you for a passphrase and create an encrypted `.age` file.

---

## 🔐 Encrypt a directory

```bash
./encrypt.sh <directory> <output.age>
```

**Example:**

```bash
./encrypt.sh my_folder encrypted_folder.age
```

The script will:
1. Compress the directory into a `.tar.gz` archive
2. Encrypt the archive using a passphrase
3. Output an `.age` file

---

## 🔓 Decrypt an `.age` file

```bash
./decrypt.sh <input.age> <output_directory>
```

**Examples:**

### Decrypt a file:

```bash
./decrypt.sh secrets.age ./output_file/
```

### Decrypt a directory archive:

```bash
./decrypt.sh encrypted_folder.age ./restored_folder/
```

The script will:
1. Prompt for the passphrase
2. Decrypt the `.age` file
3. Extract the contents to the specified directory

---

## 💡 Optional: Automate passphrase with environment variable

You can avoid the prompt by setting the `AGE_PASSPHRASE` environment variable:

```bash
export AGE_PASSPHRASE="your-strong-password"
./decrypt.sh secrets.age ./output/
```

---

## ✅ Example Workflow

```bash
# Encrypt a personal config file
./encrypt.sh ~/.ssh/config ssh_config.age

# Encrypt an entire folder
./encrypt.sh ~/Documents/private notes.age

# Decrypt it later
./decrypt.sh notes.age ./notes_restored/
```





