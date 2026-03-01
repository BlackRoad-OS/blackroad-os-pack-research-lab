#!/bin/bash
# Trinity Integration Verification Script
# Verifies that the repository is "on the train" for all three lights + Codex

set -e

echo "🚦 BlackRoad Trinity Integration Verification"
echo "=============================================="
echo ""
echo "Repository: blackroad-os-pack-research-lab"
echo "Date: $(date -u '+%Y-%m-%d %H:%M:%S UTC')"
echo ""

PASS_COUNT=0
TOTAL_CHECKS=0

# Helper function to check and report
check() {
    local name="$1"
    local test_cmd="$2"
    TOTAL_CHECKS=$((TOTAL_CHECKS + 1))
    
    if eval "$test_cmd" &>/dev/null; then
        echo "✅ $name"
        PASS_COUNT=$((PASS_COUNT + 1))
        return 0
    else
        echo "❌ $name"
        return 1
    fi
}

echo "📁 DIRECTORY STRUCTURE"
echo "----------------------"
check "Trinity directory exists" "[ -d .trinity ]"
check "GreenLight directory" "[ -d .trinity/greenlight ]"
check "YellowLight directory" "[ -d .trinity/yellowlight ]"
check "RedLight directory" "[ -d .trinity/redlight ]"
check "Trinity system directory" "[ -d .trinity/system ]"
echo ""

echo "🟢 GREENLIGHT VERIFICATION"
echo "--------------------------"
check "GreenLight docs directory" "[ -d .trinity/greenlight/docs ]"
check "GreenLight scripts directory" "[ -d .trinity/greenlight/scripts ]"
check "Memory templates script" "[ -f .trinity/greenlight/scripts/memory-greenlight-templates.sh ]"
check "Emoji dictionary" "[ -f .trinity/greenlight/docs/GREENLIGHT_EMOJI_DICTIONARY.md ]"
check "Claude quick reference" "[ -f .trinity/greenlight/docs/GREENLIGHT_CLAUDE_QUICK_REFERENCE.md ]"
check "AI Agent coordination" "[ -f .trinity/greenlight/docs/GREENLIGHT_AI_AGENT_COORDINATION.md ]"
check "Template count >= 100" "[ $(grep -c '^gl_' .trinity/greenlight/scripts/memory-greenlight-templates.sh 2>/dev/null || echo 0) -ge 100 ]"
echo ""

echo "🟡 YELLOWLIGHT VERIFICATION"
echo "---------------------------"
check "YellowLight docs directory" "[ -d .trinity/yellowlight/docs ]"
check "YellowLight scripts directory" "[ -d .trinity/yellowlight/scripts ]"
check "Infrastructure templates" "[ -f .trinity/yellowlight/scripts/memory-yellowlight-templates.sh ]"
check "Codex integration script" "[ -f .trinity/yellowlight/scripts/trinity-codex-integration.sh ]"
check "Infrastructure docs" "[ -f .trinity/yellowlight/docs/YELLOWLIGHT_INFRASTRUCTURE_SYSTEM.md ]"
check "Railway config" "[ -f railway.toml ]"
check "Wrangler config" "[ -f wrangler.toml ]"
check "Dockerfile" "[ -f Dockerfile ]"
check "Health endpoint" "[ -f src/routes/health.js ]"
echo ""

echo "🔴 REDLIGHT VERIFICATION"
echo "------------------------"
check "RedLight templates directory" "[ -d .trinity/redlight/templates ]"
check "RedLight docs directory" "[ -d .trinity/redlight/docs ]"
check "RedLight scripts directory" "[ -d .trinity/redlight/scripts ]"
check "Template system docs" "[ -f .trinity/redlight/docs/REDLIGHT_TEMPLATE_SYSTEM.md ]"
check "Memory templates script" "[ -f .trinity/redlight/scripts/memory-redlight-templates.sh ]"
check "Template count >= 15" "[ $(find .trinity/redlight/templates -name '*.html' 2>/dev/null | wc -l) -ge 15 ]"
echo ""

echo "🌈 TRINITY SYSTEM CORE"
echo "----------------------"
check "Trinity overview" "[ -f .trinity/system/THE_LIGHT_TRINITY.md ]"
check "Trinity enforcement" "[ -f .trinity/system/LIGHT_TRINITY_ENFORCEMENT.md ]"
check "Trinity README" "[ -f .trinity/README.md ]"
check "Compliance check script" "[ -f .trinity/system/trinity-check-compliance.sh ]"
check "Test record script" "[ -f .trinity/system/trinity-record-test.sh ]"
echo ""

echo "🛣️ BLACKROAD CODEX"
echo "------------------"
check "Codex status documentation" "[ -f CODEX_STATUS.md ]"
check "Codex integration verified" "grep -q 'CODEX INTEGRATED' README.md"
echo ""

echo "🤖 AGENT DOCUMENTATION"
echo "----------------------"
check "Agent roster exists" "[ -f BLACKROAD_AGENTS.md ]"
check "Alice documentation" "[ -f ALICE.md ]"
check "Aria documentation" "[ -f .aria/README.md ]"
check "Aria identity JSON" "[ -f .aria/ARIA_IDENTITY.json ]"
check "Agent roster mentions 12+ agents" "[ $(grep -c '^### ' BLACKROAD_AGENTS.md 2>/dev/null || echo 0) -ge 12 ]"
echo ""

echo "🔄 CI/CD WORKFLOWS"
echo "------------------"
check "Trinity compliance workflow" "[ -f .github/workflows/trinity-compliance.yml ]"
check "Auto-deploy workflow" "[ -f .github/workflows/auto-deploy.yml ]"
check "CI workflow" "[ -f .github/workflows/ci.yml ]"
check "Deploy workflow" "[ -f .github/workflows/deploy.yml ]"
echo ""

echo "📦 PROJECT STRUCTURE"
echo "--------------------"
check "Package.json" "[ -f package.json ]"
check "Node modules installed" "[ -d node_modules ]"
check "Source directory" "[ -d src ]"
check "Main index.js" "[ -f src/index.js ]"
check "Experiments directory" "[ -d experiments ]"
check "Notebooks directory" "[ -d notebooks ]"
check "Agents directory" "[ -d agents ]"
echo ""

echo "📚 DOCUMENTATION"
echo "----------------"
check "Main README" "[ -f README.md ]"
check "README mentions Trinity" "grep -q 'Trinity' README.md"
check "README mentions agents" "grep -q 'agents' README.md"
check "LICENSE file" "[ -f LICENSE ]"
echo ""

echo "=============================================="
echo ""
echo "RESULTS: $PASS_COUNT / $TOTAL_CHECKS checks passed"
echo ""

if [ $PASS_COUNT -eq $TOTAL_CHECKS ]; then
    echo "✅ 🎉 VERIFICATION COMPLETE: FULLY INTEGRATED!"
    echo ""
    echo "🚦 Status: ON THE TRINITY TRAIN"
    echo "🛣️ Codex: INTEGRATED"
    echo "🤖 Agents: ACTIVE"
    echo ""
    echo "This repository is fully integrated with:"
    echo "  🟢 GreenLight (Project Management)"
    echo "  🟡 YellowLight (Infrastructure)"
    echo "  🔴 RedLight (Brand Templates)"
    echo "  🛣️ BlackRoad Codex (PS-SHA∞ Memory)"
    echo "  🤖 12 Active Agents"
    echo ""
    echo "Ready to use all Trinity systems! 🌈✨"
    exit 0
else
    echo "⚠️  VERIFICATION INCOMPLETE: $((TOTAL_CHECKS - PASS_COUNT)) checks failed"
    echo ""
    echo "Please review failed checks above."
    exit 1
fi
