public class C3x5_RMOML_MOM {
   static func Execute(W: WordModelSOA, wordCount: Int) -> ClusterModel {
        let interlockWidth = 3
        let interlockHeight = 5
        let stride = interlockWidth + interlockHeight
        var index = 0 //pointer to where we should put next set of words
        var shapeCount = 0
        var outerStart: [UInt8] = []
        var wordId: [UInt8] = []

        for phase in 0..<2 {
            if phase == 1 {
                wordId = Array(repeating: 0, count: stride * shapeCount)
                outerStart = Array(repeating: 0, count: stride * shapeCount)
            }

            for middley1 in 0..<wordCount {

                if (W.Len[middley1] == interlockHeight) {
                    //print("middley1:\(W.Start[middley1])")

                    for right1 in 0..<wordCount {

                        if (W.Len[right1] >= interlockWidth &&
                            W.Start[right1][0] == W.Start[middley1][0] &&
                            W.Id[right1] != W.Id[middley1]) {
                            //print("right1:\(W.Start[right1])")

                            for outery2 in 0..<wordCount {

                                if W.Len[outery2] >= interlockHeight + 2 {

                                    let outery2Limit = Int(W.Len[outery2]) - Int(interlockHeight)
                                    for outery2Pos in 1..<outery2Limit {

                                        if (W.Start[outery2][outery2Pos + 0] == W.Start[right1][1] &&
                                        W.Id[outery2] != W.Id[right1] &&
                                        W.Id[outery2] != W.Id[middley1]) {
                                            //print("outery2:\(W.Start[outery2])")

                                            for middlex2 in 0..<wordCount {

                                                if (W.Len[middlex2] == interlockWidth &&
                                                    W.Start[middlex2][0] == W.Start[middley1][1] &&
                                                    W.Start[middlex2][1] == W.Start[outery2][outery2Pos + 1] &&
                                                    W.Id[middlex2] != W.Id[outery2] &&
                                                    W.Id[middlex2] != W.Id[right1] &&
                                                    W.Id[middlex2] != W.Id[middley1]) {
                                                    //print("middlex2:\(W.Start[middlex2])")

                                                    for middley3 in 0..<wordCount {

                                                        if (W.Len[middley3] == interlockHeight &&
                                                            W.Start[middley3][0] == W.Start[right1][2] &&
                                                            W.Start[middley3][1] == W.Start[middlex2][2] &&
                                                            W.Id[middley3] != W.Id[middlex2] &&
                                                            W.Id[middley3] != W.Id[outery2] &&
                                                            W.Id[middley3] != W.Id[right1] &&
                                                            W.Id[middley3] != W.Id[middley1]) {
                                                            //print("middley3:\(W.Start[middley3])")

                                                            for outerx3 in 0..<wordCount {

                                                                if W.Len[outerx3] >= interlockWidth + 2 {

                                                                    let outerx3Limit = Int(W.Len[outerx3]) - Int(interlockWidth)
                                                                    for outerx3Pos in 1..<outerx3Limit {

                                                                        if (W.Start[outerx3][outerx3Pos + 0] == W.Start[middley1][2] &&
                                                                        W.Start[outerx3][outerx3Pos + 1] == W.Start[outery2][outery2Pos + 2] &&
                                                                        W.Start[outerx3][outerx3Pos + 2] == W.Start[middley3][2] &&
                                                                        W.Id[outerx3] != W.Id[middley3] &&
                                                                        W.Id[outerx3] != W.Id[middlex2] &&
                                                                        W.Id[outerx3] != W.Id[outery2] &&
                                                                        W.Id[outerx3] != W.Id[right1] &&
                                                                        W.Id[outerx3] != W.Id[middley1]) {
                                                                            //print("outerx3:\(W.Start[outerx3])")

                                                                            for middlex4 in 0..<wordCount {

                                                                                if (W.Len[middlex4] == interlockWidth &&
                                                                                    W.Start[middlex4][0] == W.Start[middley1][3] &&
                                                                                    W.Start[middlex4][1] == W.Start[outery2][outery2Pos + 3] &&
                                                                                    W.Start[middlex4][2] == W.Start[middley3][3] &&
                                                                                    W.Id[middlex4] != W.Id[outerx3] &&
                                                                                    W.Id[middlex4] != W.Id[middley3] &&
                                                                                    W.Id[middlex4] != W.Id[middlex2] &&
                                                                                    W.Id[middlex4] != W.Id[outery2] &&
                                                                                    W.Id[middlex4] != W.Id[right1] &&
                                                                                    W.Id[middlex4] != W.Id[middley1]) {
                                                                                    //print("middlex4:\(W.Start[middlex4])")

                                                                                    for left5 in 0..<wordCount {

                                                                                        if (W.Len[left5] >= interlockWidth &&
                                                                                            W.End[left5][2] == W.Start[middley1][4] &&
                                                                                            W.End[left5][1] == W.Start[outery2][outery2Pos + 4] &&
                                                                                            W.End[left5][0] == W.Start[middley3][4] &&
                                                                                            W.Id[left5] != W.Id[middlex4] &&
                                                                                            W.Id[left5] != W.Id[outerx3] &&
                                                                                            W.Id[left5] != W.Id[middley3] &&
                                                                                            W.Id[left5] != W.Id[middlex2] &&
                                                                                            W.Id[left5] != W.Id[outery2] &&
                                                                                            W.Id[left5] != W.Id[right1] &&
                                                                                            W.Id[left5] != W.Id[middley1]) {
                                                                                            //print("left5:\(W.Start[left5])")

                                                                                            if phase == 0 {
                                                                                                shapeCount += 1
                                                                                            }
                                                                                            else {
                                                                                                outerStart[index + 2] = UInt8(outerx3Pos)

                                                                                                outerStart[index + 6] = UInt8(outery2Pos)

                                                                                                ClusterHelper.AddWords(index: &index, wordId: &wordId, wordsToAdd: [right1, middlex2, outerx3, middlex4, left5, middley1, outery2, middley3])
                                                                                            }
                                                                                        }
                                                                                    }
                                                                                }
                                                                            }
                                                                        }
                                                                    }
                                                                }
                                                            }
                                                        }
                                                    }
                                                }
                                            }
                                        }
                                    }
                                }
                            }
                        }
                    }
                }
            }
        }

        return ClusterModel(
            wordId: wordId,
            outerStart: outerStart,
            patternHorizontal: [.trailing, .middle, .outer, .middle, .leading],
            patternVertical: [.middle, .outer, .middle],
            interlockWidth: interlockWidth,
            interlockHeight: interlockHeight,
            stride: stride,
            size: shapeCount)
    }
}