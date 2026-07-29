import GeometricProbabilityStochasticGeometry60d99CanonicalLaneLean.LimitTheoremPackage

namespace HautevilleHouse
namespace GeometricProbabilityStochasticGeometry60d99CanonicalLaneLean

structure ItoIntegralPackage where
  pointProcess : StochasticGeometryObject
  integrand : Type
  integrator : Type
  integralDefined : Prop
  itoIsometry : Prop

structure ItoIntegralEvidence (I : ItoIntegralPackage) where
  integralDefinedClosed : I.integralDefined
  itoIsometryClosed : I.itoIsometry

def ItoIntegralClosed (I : ItoIntegralPackage) : Prop :=
  I.integralDefined ∧ I.itoIsometry

theorem ito_integral_closed_from_evidence (I : ItoIntegralPackage)
    (E : ItoIntegralEvidence I) : ItoIntegralClosed I :=
  And.intro E.integralDefinedClosed E.itoIsometryClosed

structure StochasticDifferentialEquationPackage where
  pointProcess : StochasticGeometryObject
  drift : Type
  diffusion : Type
  solutionExists : Prop
  uniqueness : Prop

structure SDEvidence (S : StochasticDifferentialEquationPackage) where
  solutionExistsClosed : S.solutionExists
  uniquenessClosed : S.uniqueness

def SDEClosed (S : StochasticDifferentialEquationPackage) : Prop :=
  S.solutionExists ∧ S.uniqueness

theorem sde_closed_from_evidence (S : StochasticDifferentialEquationPackage)
    (E : SDEvidence S) : SDEClosed S :=
  And.intro E.solutionExistsClosed E.uniquenessClosed

end GeometricProbabilityStochasticGeometry60d99CanonicalLaneLean
end HautevilleHouse