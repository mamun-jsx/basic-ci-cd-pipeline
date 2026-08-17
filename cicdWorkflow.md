# GitHub Actions CI/CD Workflow শিক্ষা ও সহজ ব্যাখ্যা (Bangla Guide)

এই ডকুমেন্টটিতে `.github/workflows/first_demo.yaml` ফাইলের প্রতিটা লাইনের কাজ এবং কেন তা ব্যবহার করা হয়েছে সহজ বাংলায় ব্যাখ্যা করা হলো।

---

## 📄 সোর্স কোড: `first_demo.yaml`

```yaml
name: First Demo Action

on:
  push:
    branches:
      - main

jobs:
  demo-job:
    runs-on: ubuntu-latest
    steps:
      - name: Action Started
        run: echo "Action started"

      - name: Checkout Repository
        uses: actions/checkout@v4

      - name: Run a one line script
        run: echo "Hello World"

      - name: Run a multiline script
        run: |
          echo "Hello"
          echo "Mamun"

      - name: List files
        run: ls ${{ github.workspace }}

      - name: Print Github Context
        env:
          GITHUB_CONTEXT: ${{ toJSON(github) }}
        run: echo "$GITHUB_CONTEXT"

      - name: Action Completed
        run: echo "Action Completed"
```

---

## 🇧🇩 লাইনের পর লাইন বিস্তারিত বাংলা ব্যাখ্যা (Line-by-Line Breakdown)

### ১. Workflow-এর নাম নির্ধারণ
```yaml
name: First Demo Action
```
- **ব্যাখ্যা:** GitHub-এর **Actions** ট্যাবে আপনার এই ওয়ার্কফ্লোটি যে শিরোনামে (Title) দেখাবে, এটি সেই নাম।

---

### ২. ট্রিগার বা ইভেন্ট শর্ত (Trigger Event)
```yaml
on:
  push:
    branches:
      - main
```
- **`on:`** কখন বা কীসের ভিত্তিতে এই অটোমেশন চালু হবে তা ঠিক করে।
- **`push:`** কোড গিটহাবে `git push` করলেই এটি রান করবে।
- **`branches: - main`**: শুধুমাত্র `main` ব্র্যাঞ্চে কোড পুশ হলেই কেবল এই অটোমেশনটি ট্রিগার হবে।

---

### ৩. জবস (Jobs) ও সার্ভার এনভায়রনমেন্ট
```yaml
jobs:
  demo-job:
    runs-on: ubuntu-latest
```
- **`jobs:`** এর ভেতরে সবকটি জবের কাজ আলাদাভাবে সাজানো থাকে।
- **`demo-job:`** এই নির্দিষ্ট জবের একটি ইউনিক নাম বা আইডি (ID)।
- **`runs-on: ubuntu-latest`**: GitHub আমাদেরকে একটি সম্পূর্ণ ফ্রেশ ভার্চুয়াল মেশিন/সার্ভার (Linux Ubuntu) প্রোভাইড করবে যেখানে আমাদের কমান্ডগুলো রান হবে।

---

### ৪. স্টেপস বা পদক্ষেপসমূহ (Steps)
```yaml
    steps:
```
- **`steps:`** জবটির ভেতরে একের পর এক যে কাজগুলো ক্রমানুসারে (Step by step) সম্পন্ন হবে সেগুলোর লিস্ট।

---

### ৫. প্রথম মেসেজ প্রিন্ট করা
```yaml
      - name: Action Started
        run: echo "Action started"
```
- **`- name:`** এই স্টেপের একটি সুন্দর নাম যা গিটহাব লগে দেখা যাবে।
- **`run:`** সেল/টার্মিনাল কমান্ড চালনা করে (`echo "Action started"` লগে মেসেজটি দেখাবে)।

---

### ৬. প্রজেক্টের কোড ডাউনলোড করা (Checkout)
```yaml
      - name: Checkout Repository
        uses: actions/checkout@v4
```
- **`uses: actions/checkout@v4`**: এটি GitHub-এর একটি অফিসিয়াল অ্যাকশন (Pre-built Action)। এটি গিটহাব থেকে আপনার প্রজেক্টের সোর্স কোড ডাউনলোড/ক্লোন করে সেই ভার্চুয়াল উবুন্টু সার্ভারে নিয়ে আসে যাতে পরের স্টেপগুলো আপনার ফাইলের ওপর কাজ করতে পারে।

---

### ৭. এক লাইনের স্ক্রিপ্ট
```yaml
      - name: Run a one line script
        run: echo "Hello World"
```
- কনসোলে বা গিটহাব লগে সাধারণ এক লাইনের টেক্সট `"Hello World"` প্রিন্ট করে।

---

### ৮. মাল্টি-লাইন স্ক্রিপ্ট (একাধিক কমান্ড)
```yaml
      - name: Run a multiline script
        run: |
          echo "Hello"
          echo "Mamun"
```
- **`run: |`**: পাইপ (`|`) চিহ্নের মাধ্যমে একাধিক লাইনের ব্যাশ (Bash) কমান্ড লেখা যায়।
- এখানে পরপর দুটি লাইনে `"Hello"` এবং `"Mamun"` প্রিন্ট হবে।

---

### ৯. প্রজেক্টের ফাইলের তালিকা দেখা
```yaml
      - name: List files
        run: ls ${{ github.workspace }}
```
- **`ls`**: সার্ভারের নির্দিষ্ট ডিরেক্টরির ফাইলের তালিকা দেখানোর কমান্ড।
- **`${{ github.workspace }}`**: গিটহাব এনভায়রনমেন্ট ভেরিয়েবল, যা সার্ভারের ভেতরে প্রজেক্ট রুট ফোল্ডারের আসল পাথ (Path) নির্দেশ করে।

---

### ১০. GitHub Context তথ্য প্রিন্ট করা
```yaml
      - name: Print Github Context
        env:
          GITHUB_CONTEXT: ${{ toJSON(github) }}
        run: echo "$GITHUB_CONTEXT"
```
- **`env:`**: এই স্টেপের জন্য এনভায়রনমেন্ট ভেরিয়েবল সেট করে।
- **`${{ toJSON(github) }}`**: এই কমিট, ইউজার ও পুশ সংক্রান্ত সকল গিটহাব অবজেক্টের তথ্যকে JSON টেক্সটে রূপান্তর করে `GITHUB_CONTEXT` নামক ভেরিয়েবলে জমা রাখে।
- **`run: echo "$GITHUB_CONTEXT"`**: ঐ সমস্ত তথ্য লগে বিস্তারিত আউটপুট দেয়।

---

### ১১. অ্যাকশন সমাপ্তি
```yaml
      - name: Action Completed
        run: echo "Action Completed"
```
- সকল কাজ সফলভাবে শেষ হলে এই শেষ বার্তাটি লগে আউটপুট হিসেবে দেখায়।

---

## 🚀 কমান্ড লাইন ব্যবহার করে GitHub-এ Push করার উপায়

আপনার টার্মিনালে এই কমান্ডগুলো একে একে চালিয়ে কোড ও এই বাংলা ফাইলটি GitHub-এ পাঠাতে পারেন:

```bash
# ১. পরিবর্তন করা ফাইলগুলো Git-এ যোগ করুন
git add .github/workflows/first_demo.yaml cicdWorkflow.md

# ২. একটি কমিট বার্তা যুক্ত করুন
git commit -m "Add Bengali documentation for CI/CD workflow"

# ৩. GitHub-এর main ব্র্যাঞ্চে পুশ করুন (এর সাথেই GitHub Actions স্বয়ংক্রিয়ভাবে চলতে শুরু করবে)
git push origin main
```
