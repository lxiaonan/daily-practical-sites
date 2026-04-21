import { mkdir } from "node:fs/promises";
import fs from "node:fs/promises";
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

function frameName(index) {
  return `${String(index).padStart(3, "0")}.png`;
}

async function capture(page, framesDir, frameIndex) {
  const outputPath = path.join(framesDir, frameName(frameIndex));
  await page.screenshot({ path: outputPath, fullPage: true });
}

const args = parseArgs(process.argv.slice(2));
const url = args.url;
const planPath = args.plan;
const framesDir = args.out;

if (!url || !planPath || !framesDir) {
  throw new Error("Usage: node capture-demo.mjs --url <url> --plan <json> --out <framesDir>");
}

const plan = JSON.parse(await fs.readFile(planPath, "utf8"));
await mkdir(framesDir, { recursive: true });

const browser = await chromium.launch({ headless: true });
const page = await browser.newPage({
  viewport: plan.viewport || { width: 1440, height: 1080 },
});

let frameIndex = 0;

await page.goto(url, { waitUntil: "networkidle" });
await page.waitForTimeout(Number(plan.initialWaitMs || 500));
await capture(page, framesDir, frameIndex);
frameIndex += 1;

for (const step of plan.steps || []) {
  if (step.waitForSelector) {
    await page.waitForSelector(step.waitForSelector);
  }

  if (step.fill) {
    await page.fill(step.fill.selector, step.fill.value);
  }

  if (step.type) {
    await page.type(step.type.selector, step.type.value, {
      delay: Number(step.type.delay || 40),
    });
  }

  if (step.click) {
    await page.click(step.click.selector);
  }

  if (step.select) {
    await page.selectOption(step.select.selector, step.select.value);
  }

  if (step.press) {
    await page.press(step.press.selector, step.press.key);
  }

  if (step.hover) {
    await page.hover(step.hover.selector);
  }

  if (step.waitMs) {
    await page.waitForTimeout(Number(step.waitMs));
  }

  if (step.capture !== false) {
    await capture(page, framesDir, frameIndex);
    frameIndex += 1;
  }
}

await browser.close();
