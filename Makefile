.PHONY: run clean publish lint format

run:
	python br_lab.py run $(EXP)

clean:
	rm -rf __pycache__ .pytest_cache .ruff_cache

publish:
	python br_lab.py publish $(EXP)
	python scripts/postbuild.py

lint:
	ruff .
	yamllint experiments

format:
	black .
