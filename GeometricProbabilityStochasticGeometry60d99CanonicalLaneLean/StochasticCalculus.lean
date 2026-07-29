import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace GeometricProbabilityStochasticGeometry60d99CanonicalLaneLean

structure StochasticCalculusPackage where
  stochasticIntegral : Prop
  itoFormula : Prop
  stochasticDifferentialEquation : Prop
  girsanovTheorem : Prop

structure StochasticCalculusEvidence (C : StochasticCalculusPackage) where
  stochasticIntegralClosed : C.stochasticIntegral
  itoFormulaClosed : C.itoFormula
  stochasticDifferentialEquationClosed : C.stochasticDifferentialEquation
  girsanovTheoremClosed : C.girsanovTheorem

def StochasticCalculusClosed (C : StochasticCalculusPackage) : Prop :=
  C.stochasticIntegral ∧ C.itoFormula ∧
  C.stochasticDifferentialEquation ∧ C.girsanovTheorem

theorem stochastic_calculus_closed_from_evidence
    (C : StochasticCalculusPackage) (E : StochasticCalculusEvidence C) :
    StochasticCalculusClosed C := by
  exact And.intro E.stochasticIntegralClosed
    (And.intro E.itoFormulaClosed
      (And.intro E.stochasticDifferentialEquationClosed E.girsanovTheoremClosed))

end GeometricProbabilityStochasticGeometry60d99CanonicalLaneLean
end HautevilleHouse