import { mkdir } from "node:fs/promises";
import path from "node:path";
import { chromium } from "playwright";

function parseArgs(argv) {
  const args = {};
  for (let i = 0; i < argv.length; i += 1) {
    const key = argv[i];
    const value = argv[i + 1];
    if (key.startsWith("--")) {
      args[key.slice(2)] = value;
      i += 1;
    }
  }
  return args;
}

const args = parseArgs(process.argv.slice(2));
const url = args.url;
const out = args.out;
const width = Number(args.width || 1440);
const height = Number(args.height || 1080);
const waitMs = Number(args.wait || 800);

if (!url || !out) {
  throw new Error("Usage: node capture-preview.mjs --url <url> --out <file> [--width 1440] [--height 1080] [--wait 800]");
}

await mkdir(path.dirname(out), { recursive: true });

const browser = await chromium.launch({ headless: true });
const page = await browser.newPage({ viewport: { width, height } });

await page.goto(url, { waitUntil: "networkidle" });
await page.waitForTimeout(waitMs);
await page.screenshot({ path: out, fullPage: true });

await browser.close();
